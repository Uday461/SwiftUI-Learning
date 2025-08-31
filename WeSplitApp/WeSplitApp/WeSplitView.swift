//
//  WeSplitView.swift
//  WeSplitApp
//
//  Created by UdayKiran Naik Banavath on 31/08/25.
//

import SwiftUI

struct WeSplitView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfpeople = 2   
    @State private var tipPercentage = 20
    private let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfpeople) {
                        ForEach(2..<100) { Text("\($0) of people") }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(.segmented)
                }
                .textCase(.lowercase)
                
                Section("Amount Per Person") {
                    Text(amountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                .textCase(.lowercase)
                
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
        var amountPerPerson: Double {
            let _checkAmount = checkAmount
            let _tipPercentage = Double(tipPercentage)
            let tipAmount = checkAmount * (_tipPercentage / 100)
            let grandTotal = tipAmount + _checkAmount
            
            return grandTotal/Double(numberOfpeople + 2)
        }
      
    }
}

#Preview {
    WeSplitView()
}

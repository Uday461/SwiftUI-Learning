//
//  ContentView.swift
//  UnitConverter
//
//  Created by UdayKiran Naik Banavath on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    let temperatures = ["Celsius", "Kelvin", "Farenheit"]
    @State private var temperature = "Celsius"
    @State private var outputTemp = "Celsius"
    @State private var inputTemp = 0.0
    @State private var output = 0.0
    @FocusState private var tempIsFocused: Bool
    
    private var numberFormatter: NumberFormatter  {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter Temperature", value: $inputTemp, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                    
                    Picker("Temperature", selection: $temperature) {
                        ForEach(temperatures, id: \.self) { Text($0) }
                    }
                }
                
                Section {
                    Picker("Temperature", selection: $outputTemp) {
                        ForEach(temperatures, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                    Text("Temperature: \(output)")
                }
            }
            .navigationTitle("Temperatures Unit Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if tempIsFocused {
                    Button("Done") {
                        tempIsFocused = false
                    }
                }

            }
        }
    }
}

#Preview {
    ContentView()
}

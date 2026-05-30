//
//  ContentView.swift
//  iExpense
//
//  Created by Banavath UdayKiran Naik on 18/05/26.
//

import SwiftUI
import Observation

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    @State private var showingSheet = false

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView()
            }
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Second View")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}

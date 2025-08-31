//
//  ContentView.swift
//  WeSplitApp
//
//  Created by UdayKiran Naik Banavath on 19/08/25.
//

import SwiftUI

//Form: Usually used to group related items together
//Section: Used when we want to split our Form view into multiple visual chunks
//NavigationStack: Used for having navigation Bar
//@State: A property wrapper that is useful for having a value that can be modified. It is recommended to be `private`
//Two-way Binding: We bind the text field so that it shows the value of our property, but we also bind so that any changes to the text field also update the property. We use '$' symbol for binding.

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                
                Section {
                    Text("One")
                }
                
                Section {
                    Text("Two")
                    Text("Two")
                }
                
                Section {
                    TextField("Enter your name", text: $name)
                }
                 
                Section {
                    Picker("Select student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Button("Tap Count: \(tapCount)") {
                    self.tapCount += 1
                }
            }
            .navigationTitle("SwiftUI Learning")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    ContentView()
}

//
//  ContentView.swift
//  UnitConverter
//
//  Created by UdayKiran Naik Banavath on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      //  VStack {
            Form {
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                
                Section {
                    Text("Hello")
                    Text("Hello")
                }
            }
            
            Form {
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
        }
     //   .padding()
  //  }
}

struct NavigationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Color(.systemGray6)
                    .frame(height: 1000)
//                Text("Uday")
//                
//                Spacer()
//                Spacer()
//                
//                Text("Kiran")
            }
        }
    }
}
#Preview {
   // ContentView()
    NavigationView()
}

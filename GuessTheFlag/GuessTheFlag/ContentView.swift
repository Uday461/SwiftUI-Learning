//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Banavath UdayKiran Naik on 06/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        VStack {
           // AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//            Text("Your content")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .foregroundStyle(.white)
//                .background(.red.gradient)
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button {
                //
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .cornerRadius(40)
            }

            Button {
                //
            } label: {
                Image(systemName: "pencil")
            }
            .buttonStyle(.bordered)
            
            Button {
                //
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK") { }
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please read this..!!")
            }
        }
    }
}

#Preview {
    ContentView()
}

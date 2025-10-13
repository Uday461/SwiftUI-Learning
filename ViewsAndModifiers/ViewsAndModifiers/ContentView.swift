//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Banavath UdayKiran Naik on 03/10/25.
//

//1. Order of modifiers matter.
//2. There is no behind the view concept in SwiftUI.
//3. Side effect of modifiers: We can apply the same modifiers multiple times.
//4. SwiftUI relies very heavily on a Swift power feature called “opaque return types”, which you can see in action every time you write some View. This means “one object that conforms to the View protocol, but we don’t want to say what.”
//5. Many modifiers can be applied to containers, which allows us to apply the same modifier to many views at the same time.
//6.@ViewBuilder: When we wish to send multiple small view chunks as a group, we can use this modifier.
//7. Custom Modifiers

import SwiftUI

struct ContentView: View {
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .padding()
                    .background(.red)
                    .padding()
                    .background(.blue)
                    .padding()
                    .background(.green)
                    .padding()
                    .background(.yellow)
                
            }
            .padding()
            //        .background(.red)
            //        .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)
            
            VStack {
                Text("Gryffindor")
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title) //Environment Modifier
            
            Divider()
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle) //Regular Modifer
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            
            Divider()
            
            VStack {
                Text("Gryffindor")
                    .blur(radius: 5)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 0)
            
            Divider()
            spells
            
            Divider()
            
            Text("UdayKiran")
                .titleStyle()
            
            Divider()
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}


struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

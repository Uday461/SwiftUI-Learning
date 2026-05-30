//
//  AppStorageView.swift
//  iExpense
//
//  Created by Banavath UdayKiran Naik on 19/05/26.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

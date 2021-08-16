//
//  ContentView.swift
//  Swiftcord
//
//  Created by Helloyunho on 2021/08/14.
//

import SwiftUI

@main
struct SwiftcordApp: App {
    @StateObject var state = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
        }
    }
}

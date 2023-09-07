//
//  EatWorkApp.swift
//  EatWork
//
//  Created by Дмитрий Х on 05.09.23.
//

import SwiftUI

final class AppSettings: ObservableObject {
    @AppStorage("isDarkMode") var isDark = false
}

@main
struct EatWorkApp: App {
    @StateObject private var appSettings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appSettings)
        }
    }
}

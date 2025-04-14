//
//  MoviesProjectApp.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import SwiftUI
import SwiftData

@main
struct MoviesProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

   

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(sharedModelContainer)
    }
}

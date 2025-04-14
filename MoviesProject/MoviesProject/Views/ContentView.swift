//
//  ContentView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            
            Tab {
                HomeView()

            } label: {
                Image(systemName: "house")
                Text("Home")
                    .textStyle(type: .tabBarText)
            }

            
            Tab(role: .search) {
                Text("search content")


            } label: {
                Image(systemName: "magnifyingglass")
                Text("Search")
                    .textStyle(type: .tabBarText)
            }
            
            Tab {
                Text("settings content")

            } label: {
                Image(systemName: "gear")
                    
                Text("Settings")
                    .textStyle(type: .tabBarText)
            }
            
        }.tint(Color(.primary))
    }


}



#Preview {
    ContentView()
}

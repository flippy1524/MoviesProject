//
//  ContentView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView {
            Tab {
                HomeView()
            } label: {
                TabLabel(systemImage: "house", text: Localized.Home.title)
            }
            
            Tab {
                FavoritesView()
            } label: {
                TabLabel(systemImage: "heart", text: Localized.Favorites.title)
            }
            
            Tab {
                SearchView()
            } label: {
                TabLabel(systemImage: "magnifyingglass", text: Localized.Search.title)
            }
            
            Tab {
                SettingsView()
            } label: {
                TabLabel(systemImage: "gear", text: Localized.Settings.title)
            }
        }
        .tint(Color(.primary))
    }
    
    struct TabLabel: View {
        let systemImage: String
        let text: String

        var body: some View {
            VStack {
                Image(systemName: systemImage)
                Text(text)
                    .textStyle(type: .tabBarText)
            }
        }
    }
}

#Preview {
    ContentView()
}

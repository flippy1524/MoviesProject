//
//  SettingsView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
        MPNavigationStack {
            VStack(spacing: 16) {
                Spacer()
                MPSegmentedPicker(items: viewModel.appearanceItems, selection: $viewModel.currentAppearance) { item in
                    return item.localized
                }.fixedSize(horizontal: false, vertical: true)
                if let scheme = viewModel.scheme {
                    Text("Current scheme: \(scheme)")
                        .textStyle(type: .headline)
                }
                
                if let baseUrl = viewModel.baseUrl {
                    Text("Base url: \(baseUrl)")
                        .textStyle(type: .headline)
                }
            }
            .padding(.horizontal, .medium)
            .padding(.vertical, .extraLarge)
        }
    }
}

#Preview {
    SettingsView()
}

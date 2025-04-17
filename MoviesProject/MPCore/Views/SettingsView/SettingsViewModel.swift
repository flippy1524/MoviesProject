//
//  SettingsViewModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//


import SwiftUI
import MPData
import MPUtils

class SettingsViewModel: ObservableObject {
    @AppStorage(Constants.AppStorage.appearance) var appearance: AppAppearance = .system
    @Published var appearanceItems = AppAppearance.allCases
    @Published var currentAppearance: AppAppearance = .system {
        didSet {
            appearance = currentAppearance
        }
    }
    
    var scheme: String? {
        Bundle.main.object(forInfoDictionaryKey: "SCHEME_NAME") as? String ?? ""
    }
    
    var baseUrl: String? {
        BaseEnvironment.baseURL
    }
}

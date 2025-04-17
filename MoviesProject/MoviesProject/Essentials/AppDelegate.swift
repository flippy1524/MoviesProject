//
//  AppDelegate.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import UIKit
import MPData
import MPCore

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        ServiceRegistry.registerServices()
        ThemeManager.shared.set(appTarget: .app1)
        return true
    }
}

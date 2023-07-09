//
//  AppDelegate.swift
//  MovieBrowser
//
//  Created by AhmedFitoh on 7/8/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setOnboardingScreen()
        return true
    }

    private func setOnboardingScreen(){
        let navigationController = MoviesListWireframe().navigationController
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

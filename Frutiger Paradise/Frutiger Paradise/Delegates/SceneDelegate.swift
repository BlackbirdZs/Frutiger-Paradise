//
//  SceneDelegate.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 30.09.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
    
        let welcomeVc = WelcomeViewController()
        
        window.rootViewController = UINavigationController(rootViewController: welcomeVc)
        window.makeKeyAndVisible()
        self.window = window
    }
}



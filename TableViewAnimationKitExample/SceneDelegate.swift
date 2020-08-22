//
//  SceneDelegate.swift
//  TestTableViewProject
//
//  Created by Mikhail Boyko on 22.08.2020.
//  Copyright © 2020 Mikhail Boyko. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewController = MainViewController()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isTranslucent = false

            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}


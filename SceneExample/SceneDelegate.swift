//
//  SceneDelegate.swift
//  SceneExample
//
//  Created by David M Reed on 6/25/19.
//  Copyright © 2019 David M Reed. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // UIWindowScene delegate

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let userActivity = connectionOptions.userActivities.first ?? session.stateRestorationActivity {
            if !configure(window: window, with: userActivity) {
                print("Failed to restore from \(userActivity)")
            }
        }

        // If there were no user activities, we don't have to do anything.
        // The `window` property will automatically be loaded with the storyboard's initial view controller.
    }

    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        return scene.userActivity
    }

    // Utilities

    func configure(window: UIWindow?, with activity: NSUserActivity) -> Bool {
        if activity.title == Document.openDocTitle {
            if let url = activity.userInfo?[Document.openDocURLKey] as? URL {
                if let documentVC = DocumentViewController.loadFromStoryboard() {
                    documentVC.document = Document(fileURL: url)
                    if let navigationController = window?.rootViewController as? UINavigationController {
                        navigationController.pushViewController(documentVC, animated: false)
                        return true
                    }
                }
            }
        }
        return false
    }

}

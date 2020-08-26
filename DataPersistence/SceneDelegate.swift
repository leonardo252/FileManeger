//
//  SceneDelegate.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: ViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .blue
        return navigationController
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
            
            
            //MARK: - #1 App Sandbox
            
            FileManager.default.printContent(from: NSHomeDirectory(), recursivelly: true)
            
            //MARK: - #2 PropertyList
            
//            let onBoardingStatusURL = URL(fileURLWithPath: NSHomeDirectory()+"/Library/Preferences/"+OnBoardingStatus.plistName)
//            if let data = try? Data(contentsOf: onBoardingStatusURL),
//               let onBoardingPropertyist = try? PropertyListDecoder().decode(OnBoardingStatus.self, from: data) {
//
//                print("FirstLaunch:", onBoardingPropertyist.firstLaunch)
//                print("FirstLaunchTimestamp:", onBoardingPropertyist.firstLaunchTimestamp)
//                print("OnBoarding has already been seen by the user.")
//            } else {
//                let status = OnBoardingStatus()
//                if let data = try? PropertyListEncoder().encode(status){
//                    try? data.write(to: onBoardingStatusURL)
//                }
//                navigationController.present(OnBoardViewController(), animated: true)
//            }
            
            //MARK: - #3 UserDefaults
            
            let isFirstLaunch: Bool = (UserDefaults.standard.value(forKey: "FirstLaunch") as? Bool) ?? false
            if !isFirstLaunch {
                UserDefaults.standard.set(true, forKey: "FirstLaunch")
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: "FirstLaunchTimestamp")
                navigationController.present(OnBoardViewController(), animated: true)
            }

        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


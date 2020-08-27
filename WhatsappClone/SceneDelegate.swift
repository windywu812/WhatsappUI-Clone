//
//  SceneDelegate.swift
//  WhatsappClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        
        let statusViewController = StatusViewController(style: .grouped)
        statusViewController.tabBarItem = UITabBarItem(title: "Status", image: UIImage(systemName: "person.circle"), tag: 0)
        let statusNavigationController = UINavigationController(rootViewController: statusViewController)
        
        let callViewController = CallViewController()
        callViewController.tabBarItem = UITabBarItem(title: "Calls", image: UIImage(systemName: "phone"), tag: 1)
        let callNavigationController = UINavigationController(rootViewController: callViewController)
        
        let cameraViewController = CameraViewController()
        cameraViewController.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 2)
        
        let chatViewController = ChatViewController()
        chatViewController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), tag: 3)
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        
        let settingViewController = SettingViewController(style: .grouped)
        settingViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        let settingNavigationController = UINavigationController(rootViewController: settingViewController)
        
        tabBarController.viewControllers = [statusNavigationController, callNavigationController, cameraViewController, chatNavigationController, settingNavigationController]
        tabBarController.selectedIndex = 3
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}


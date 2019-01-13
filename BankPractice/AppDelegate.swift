//
//  AppDelegate.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = window?.rootViewController as! UINavigationController
        let bankListViewController = navigationController.topViewController as! BankListViewController
        bankListViewController.dataProvider.bankDataManager = BankDataManager.shared
        
        return true
    }


}


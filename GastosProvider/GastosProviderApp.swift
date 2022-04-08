//
//  GastosProviderApp.swift
//  GastosProvider
//
//  Created by mnameit on 12/01/22.
//

import SwiftUI
import UIKit
import Firebase

@main
struct GastosProviderApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
          ContentView()
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()
    return true
  }

  // needed for firebase phone auth
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
  }
}

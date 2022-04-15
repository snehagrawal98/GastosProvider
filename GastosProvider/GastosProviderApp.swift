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
          //AddQRs()
        }
    }
}

//class AppDelegate: NSObject,UIApplicationDelegate {
//
//    static var orientationLock = UIInterfaceOrientationMask.portrait
//
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//      FirebaseApp.configure()
//    return true
//  }
//
//  // needed for firebase phone auth
//  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//  }
//
//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//
//      return AppDelegate.orientationLock
//
//    }
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//      print("\(#function)")
//      Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
//    }
//
//}


class AppDelegate: NSObject, UIApplicationDelegate {
        static var orientationLock = UIInterfaceOrientationMask.portrait

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("SwiftUI_2_Lifecycle_PhoneNumber_AuthApp application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    return true
  }

  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("\(#function)")
    Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
  }
  
  func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    print("\(#function)")
    if Auth.auth().canHandleNotification(notification) {
      completionHandler(.noData)
      return
    }
  }
  
  func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
    print("\(#function)")
    if Auth.auth().canHandle(url) {
      return true
    }
    return false
  }
    
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    
          return AppDelegate.orientationLock
    
        }
    
}

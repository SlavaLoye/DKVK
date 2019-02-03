//
//  AppDelegate.swift
//  DKVK
//
//  Created by Hadevs on 02/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
// 7 - lesson - 58  мнинут 

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Router.shared.root(&window)
        FirebaseApp.configure()
        AuthManager.shared.signInIfNeeded { _ in
            UserManager.shared.fetchCurrentUser()
        }
        // erase data from the database
       // SecureStorageManager.shared.eraseUserDataIfNeeded()
        
        // тестируем чат
        
//        let chat = Chat()
//        chat.id = "123"
//        ChatManager.shared.loadingMessages(chat: chat) { (messages) in
//            print(messages)
     //   }
        
        
//        let message = Message()
//        message.senderId = "123"
//        message.text = "text"
//        message.time =  Date().timeIntervalSince1970
//        let chat = Chat()
//        chat.id = "123"
//        ChatManager.shared.send(message: message, on: chat)
        
        return true
   // }
    }
}


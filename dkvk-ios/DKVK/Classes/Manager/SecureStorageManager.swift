//
//  SecureStorageManager.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//


import Foundation
import Locksmith

final class SecureStorageManager {

    //MARK: - properties
    
    static let shared = SecureStorageManager()
    
    let myUserAccountIdentifier = "MyUserAccountIdentifier"
    
    private init() {}
    
    //MARK: -  func save
    func save(email: String?, password: String?, completionHandler: ItemClosure<CustomErrors?>) {
        guard let email = email, let password = password else {
            completionHandler(CustomErrors.keychainError)
            return
        }
        let data = [Keys.email.rawValue: email,
                    Keys.password.rawValue: password]
        do {
            try Locksmith.saveData(data: data, forUserAccount: myUserAccountIdentifier)
            completionHandler(nil)
        }
        catch {
            completionHandler(CustomErrors.keychainError)
        }
    }
    
    //MARK: -  eraseUserDataIfNeeded
    
    func eraseUserDataIfNeeded() {
        guard isLoggedIn() else {
            return
        }
        
        try? Locksmith.deleteDataForUserAccount(userAccount: myUserAccountIdentifier)
    }
    
    //MARK: -  loadEmailAndPassword
    
    func loadEmailAndPassword() -> (email: String?, password: String?) {
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: myUserAccountIdentifier)
        let email = dictionary?[Keys.email.rawValue] as? String ?? nil
        let password = dictionary?[Keys.password.rawValue] as? String ?? nil
        return (email: email, password: password)
    }
    
    //MARK: -  isLoggedIn
    
    func isLoggedIn() -> Bool {
        let credentials = loadEmailAndPassword()
        return credentials.email != nil && credentials.password != nil
    }
}

    //MARK: -  extension SecureStorageManager (enum Keys

private extension SecureStorageManager {
    enum Keys: String {
        case email
        case password
    }
}

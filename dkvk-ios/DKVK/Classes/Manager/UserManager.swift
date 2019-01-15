//
//  UserManager.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 12/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit
import Firebase

final class UserManager: FirebaseManager {
    
    //MARK: - singleton
    
    static let shared = UserManager()
    
    private override init() {}
    func loadingUsers(completion: @escaping ItemClosure<[DKUser]>) {
        usersRef.observe(.value) { (snapshot) in
            if let dict = (snapshot.value as? [String: [String: Any]]) {
                completion(dict.map({ (userDict) -> DKUser in
                    return try! DKUser(from: userDict.value)
                }))
            }
        }
    }
}

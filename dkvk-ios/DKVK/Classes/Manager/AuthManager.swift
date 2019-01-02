//
//  AuthManager.swift
//  DKVK
//
//  Created by Hadevs on 16/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AuthManager {
    
    var currentUser: User?
    
    static let shared = AuthManager()
    private init() {}
    
    private var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    
    private var usersRef: DatabaseReference {
        return sourceRef.child("users")
    }
    
    private let auth = Auth.auth()
    // авторизация
    func signIn(with email: String, and password: String, completion: @escaping ItemClosure<FirebaseResult>) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(FirebaseResult.error(error.localizedDescription))
                return
            }
            
            guard let user = result?.user else {
                completion(FirebaseResult.error("User not exist"))
                return
            }
            
            self.currentUser = user
            completion(FirebaseResult.success)
        }
    }
    
    func register(with model: RegisterModel, completion: @escaping ResultHandler<Void>) {
        guard model.isFilled else {
            completion(.failure(CustomErrors.unknownError))
            return
        }
        guard let email = model.email, let password = model.password else {
            completion(.failure(CustomErrors.unknownError))
            return
        }
        
        /// eazy validation for @ and dot localy. other ones are on the server
        guard Validators.isSimpleEmail(email) else {
            completion(.failure(CustomErrors.invalidEmail))
            return
        }
        
        let id = model.userId
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let _ = result {
                // TODO: use result if need
                var dict = model.dict
                dict["id"] = id
                    // подгружаем фотку опять для того что бы она успела загрузиться в UI и на бэкенд (есть решение блокиратор остановить UI)
                self.usersRef.child(id).setValue(dict, withCompletionBlock: { (error, reference) in
                    self.addAvatarUrlIfNeeded(for: model)
                    completion(.success(()))
                })
            } else {
                completion(.failure(CustomErrors.unknownError))
            }
        }
    }
    
    func addAvatarUrlIfNeeded(for model: RegisterModel) {
        StorageManager.shared.loadAvatarUrl(for: model) { (url) in
            guard let url = url else {
                return
            }
            // Firebase не знает NSurl поэтому пишем absoluteString
            self.usersRef.child(model.userId).child("avatarUrl").setValue(url.absoluteString)
        }
    }
}

//class AuthManager {
//    static let shared = AuthManager()
//    private init() {}
//
//    private var sourceRef: DatabaseReference {
//        return Database.database().reference()
//    }
//
//    private let auth = Auth.auth()
//
//    func register(with model: RegisterModel, completion: VoidClosure) {
//        guard model.isFilled else {
//            return
//        }
//        guard let email = model.email, let password = model.password else {
//            return
//        }
//
//        let usersRef = sourceRef.child("users")
//        let id = UUID.init().uuidString
//        auth.createUser(withEmail: email, password: password) { (result, error) in
//            var dict = model.dict
//            dict["id"] = id
//            usersRef.child(id).setValue(dict)
//        }
//    }
//}

//
//  StorageManager.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 29/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit
import FirebaseStorage

    //MARK: - StorageManager

class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    private let sourceRef = Storage.storage().reference()
    
    //MARK: - upload
    
    func upload(photo: UIImage, by model: RegisterModel, closure: VoidClosure? = nil) {
        guard let data = photo.jpegData(compressionQuality: 0.5) else {
            return
        }
        sourceRef.child(Keys.avatars.rawValue).child(model.userId).putData(data, metadata: nil) { (metadata, error) in
            closure?()
        }
    }
    
    //MARK: - loadAvatarUrl
    
    func loadAvatarUrl(for model: RegisterModel, closure: @escaping OptionalItemClosure<URL>) {
        sourceRef.child(Keys.avatars.rawValue).child(model.userId).downloadURL { (url, error) in
            closure(url)
        }
    }
}

    //MARK: - extension StorageManager

extension StorageManager {
    private enum Keys: String {
        case avatars
    }
}

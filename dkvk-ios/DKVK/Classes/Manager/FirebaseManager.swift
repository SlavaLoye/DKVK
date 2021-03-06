//
//  FirebaseManager.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseManager {
    
    var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return sourceRef.child("users")
    }
    
    var chatsRef: DatabaseReference {
        return sourceRef.child("chats")
    }
}

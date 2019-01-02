//
//  Post.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation
import Firebase

class Post: Codable {
    enum `Type`: String, Codable {
        case text
        case textAndImage
        case image
    }
    var id: String
    var type: Type
    var text: String?
    var imageData: Data?
    var dateUnix: TimeInterval
    
    init() {
        self.id = UUID().uuidString
        self.dateUnix = Date().timeIntervalSince1970
        self.type = .text
    }
    
    convenience init(text: String) {
        self.init()
        self.type = .text
        self.text = text
    }
}

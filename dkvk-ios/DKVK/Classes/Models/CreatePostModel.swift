//
//  CreatePostModel.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 11/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//


import UIKit

final class CreatePostModel {
    
    //MARK: - privet propirties
    
    private(set) var text: String?
    private(set) var image: UIImage?
    
    func set(text: String?) {
        self.text = text
    }
    
    func set(image: UIImage?) {
        self.image = image
    }
    
    //MARK: -  compyted properties Data
    
    var imageData: Data? {
        return image?.jpegData(compressionQuality: 0.5)
    }
    
    //MARK: -  compyted properties Bool
    
    var isFilled: Bool {
        return text != nil || image != nil
    }
}


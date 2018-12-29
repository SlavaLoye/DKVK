//
//  TextField.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 29/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit


final class TextField: UITextField {
    
    private let leftSpacing: CGFloat = 16
    
    override func didMoveToSuperview() {
        backgroundColor = .white
    }
    
    private func defaultRect(for bounds: CGRect) -> CGRect {
        return CGRect.init(x: leftSpacing, y: 0, width: bounds.width - leftSpacing, height: bounds.height)
    }
   
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return defaultRect(for: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return defaultRect(for: bounds)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return defaultRect(for: bounds)
    }
}


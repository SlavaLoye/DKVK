//
//  CreatePostViewController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTargets()
    }
    
    private func addTargets() {
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    @objc private func doneButtonClicked() {
        guard let text = textView.text, !text.isEmpty else {
            showAlert(with: "Error", and: "Text is empty")
            return
        }
        
        guard let user = AuthManager.shared.currentUser else {
            showAlert(with: "Error", and: "User not logged in")
            return
        }
        
        PostManager.shared.createPost(from: user, with: text) { (result) in
            switch result {
            case .error(let textError):
                self.showAlert(with: "Errror", and: textError)
            case .success:
                self.showAlert(with: "Success", and: "Post has been created")
            }
        }
    }
}

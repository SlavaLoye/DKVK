//
//  CreatePostViewController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 13/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

final class CreatePostViewController: UIViewController {
    
    //MARK: - @IBOutlet()
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var crossImageView: UIImageView!
    
    
     //MARK: - properties
    
    private let model = CreatePostModel()
    
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(vc: self)
        textView.delegate = self
        addTargets()
        addGestures()
        clear()
    }
}

    //MARK: - extension CreatePostViewController: UITextViewDelegate()

extension CreatePostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text
        model.set(text: text)
    }
}

private extension CreatePostViewController {
    private func set(image: UIImage?) {
        updatePostImageView(image: image)
        model.set(image: image)
    }
    
    private func clear() {
        set(image: nil)
        textView.text = nil
        textView.resignFirstResponder()
    }
    
    func addTargets() {
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    //MARK: - addGestures()
    
    func addGestures() {
        let postImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(postImageClicked))
        postImageView.addGestureRecognizer(postImageTapGesture)
        
        let crossTapGesture = UITapGestureRecognizer(target: self, action: #selector(crossImageClicked))
        crossImageView.addGestureRecognizer(crossTapGesture)
    }
    
    //MARK: - postImageClicked()
    
    @objc func postImageClicked() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: - crossImageClicked()
    
    @objc func crossImageClicked() {
        updatePostImageView(image: nil)
    }
    
    //MARK: - objc doneButtonClicked()
    
    @objc func doneButtonClicked() {
        guard let user = AuthManager.shared.currentUser else {
            showAlert(with: "Error", and: "User not logged in")
            return
        }
        
        PostManager.shared.createPost(from: user, with: model) { (result) in
            switch result {
            case .error(let textError):
                self.showAlert(with: "Error", and: textError)
            case .success:
                self.clear()
                self.showAlert(with: "Success", and: "Post has been created")
            }
        }
    }
    
    //MARK: - doneButtonClicked()
    
    func updatePostImageView(image: UIImage?) {
        guard let image = image else {
            postImageView.image = #imageLiteral(resourceName: "tap_button")
            crossImageView.isHidden = true
            return
        }
        crossImageView.isHidden = false
        postImageView.image = image
    }
}


    //MARK: - private extension CreatePostViewController(Decorator)

private extension CreatePostViewController {
    final class Decorator {
        static func decorate(vc: CreatePostViewController) {
            vc.postImageView.isUserInteractionEnabled = true
            vc.crossImageView.isUserInteractionEnabled = true
            vc.textView.placeholder = "Add post message..."
        }
    }
}

    //MARK: - extension CreatePostViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate()

extension CreatePostViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            set(image: editedImage)
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            set(image: image)
        }
    }
}

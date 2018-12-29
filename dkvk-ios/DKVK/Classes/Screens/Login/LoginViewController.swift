//
//  LoginViewController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 29/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
        addRightButton()
    }
    
    private func addRightButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClicked))
        navigationItem.rightBarButtonItem = button
    }
    @objc private func doneButtonClicked() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        guard !email.isEmpty && !password.isEmpty else {
            showAlert(with: "Ошибка", and: "Заполните все поля")
            return
        }
        
        AuthManager.shared.signIn(with: email, and: password) { (result) in
            switch result {
            case .success:
                self.showAlert(with: "Успешно", and: "Вы авторизированны")
            case .error(let error):
                self.showAlert(with: "Ошибка ", and: error)
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

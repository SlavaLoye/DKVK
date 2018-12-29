//
//  ViewController.swift
//  DKVK
//
//  Created by Hadevs on 02/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -  @IBOutlet
    
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var logoView: UIImageView!
    
    //MARK: -  viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(self)
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addTargets() {
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signinButtonClicked), for: .touchUpInside)
    }
    
    @objc private func signinButtonClicked() {
        StartRouter.shared.goToLoginScreen(from: self)
    }
    
    @objc private func signUpButtonClicked() {
        StartRouter.shared.goToRegisterScreen(from: self)
    }
}

    //MARK: -  extension ViewController

extension ViewController {
    fileprivate class Decorator {
        static let buttonCornerRadius: CGFloat = 4
        private init() {}
        
        static func decorate(_ vc: ViewController) {
            vc.signUpButton.layer.cornerRadius = buttonCornerRadius
            vc.signUpButton.layer.borderColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
        }
    }
}

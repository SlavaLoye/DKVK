//
//  ChatViewControllerViewController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 11/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//


import UIKit

class ChatViewController: UIViewController {
    
     // MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - properties
    
    private var user: DKUser?
    private var chat: Chat?
    
    private lazy var controller = ChatController.init(viewController: self, chat: chat!) //48
    
    convenience init(user: DKUser, chat: Chat) {
        self.init()
        self.user = user
        self.chat = chat
}
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // delegating()
        controller.viewDidLoad()
        tableView.separatorColor = .clear
    
    }
    
    @IBAction func sendClicked() {
        let text =  textField.text
        controller.sendButtonClicked(with: text)
        
    }
}

     // MARK: - extension ChatViewController: UITableViewDelegate()

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

    // MARK: - extension ChatViewController: UITableViewDataSource()

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

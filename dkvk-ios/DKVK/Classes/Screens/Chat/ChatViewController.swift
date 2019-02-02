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
    
    // MARK: - properties
    
    private var user: DKUser?
    private lazy var conntroller = ChatController.init(viewController: self)
    
    convenience init(user: DKUser) {
        self.init()
        self.user = user
}
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegating()
        
    }
    
    // MARK: - delegating()
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = self
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

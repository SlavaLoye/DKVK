//
//  ChatsViewController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 11/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var users: [DKUser] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegating()
        UserManager.shared.loadingUsers {
            users in
            self.users = users
        }
    }
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        cell.textLabel?.text = user.email ?? user.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}

//
//  ChatsViewController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 11/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    
    // MARK: - @IBOutlet()
    
    @IBOutlet weak var tableView: UITableView!
   
    private var chats: [Chat] = [] {
        
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - @viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegating()
        ChatManager.shared.loadingChats { [unowned self] (chats) in
            self.chats = chats
        }
    }
    
    // MARK: - @delegating()
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

    //MARK: - @extension ChatsViewController: UITableViewDelegate()

extension ChatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let chat = chats[indexPath.row]
            if let oponent = chat.oponent {
            let vc = ChatViewController(user: oponent, chat: chat)
                navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

    //MARK: - @extension ChatsViewController: UITableViewDataSource()

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let chat = self.chats[indexPath.row]
        cell.textLabel?.text = chat.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
}

//
//  ChatController.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 26/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

final class ChatController {
 
    
    weak var viewController: ChatViewController?
    
    var tableView: UITableView? {
        return viewController?.tableView
}
    
    init(viewController: ChatViewController) {
        self.viewController = viewController
    }
    
    private func delegating() {
        viewController?.tableView.delegate = viewController
         viewController?.tableView.dataSource = viewController
    }
}


extension ChatController: Lyfecycable {
    
    func viewDidAppear() {
        
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
}

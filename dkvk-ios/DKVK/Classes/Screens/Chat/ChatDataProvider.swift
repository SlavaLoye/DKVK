//
//  ChatDataProvider.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit



final class ChatDataProvider {
    
    private var messages: [Message] = []
    
    func set(messages: [Message])  {
        self.messages = messages
    }
    
    func numberOfRows() -> Int {
        return messages.count
    }
    
    func message(by indexPath: IndexPath) -> Message {
        return messages[indexPath.row]
    }
    
}


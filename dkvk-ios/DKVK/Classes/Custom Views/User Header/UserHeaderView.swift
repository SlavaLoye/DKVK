//
//  UserHeaderView.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 30/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit
import Firebase

final class UserHeaderView: UIView, NibLoadable {
    
    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.round()
    }
    
    func confingure(by user: User)  {
        
    }
}

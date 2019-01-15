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
    
    //MARK: -  @IBOutlet
    
    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: -  layoutSubviews()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.round()
    }
    
    //MARK: -  confingure()
    
    func confingure(by user: User)  {
        
    }
}

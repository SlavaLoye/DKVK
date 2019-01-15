//
//  TextFieldTableViewCell.swift
//  DKVK
//
//  Created by Hadevs on 10/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, NibLoadable {
    
     //MARK: -  @IBOutlet
	
	@IBOutlet  weak var textField: UITextField!
	
	var textChanged: ItemClosure<String>?
    
    //MARK: -  @awakeFromNib()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		addTargets()
	}
    
    //MARK: -  @addTargets()
	
	private func addTargets() {
		textField.addTarget(self, action: #selector(textFieldChanged(sender:)), for: .editingChanged)
	}
    
    //MARK: -  @textFieldChanged()
	
	@objc private func textFieldChanged(sender: UITextField) {
		textChanged?(sender.text ?? "")
	}
}

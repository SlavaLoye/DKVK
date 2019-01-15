//
//  InfoUserTableViewCell.swift
//  DKVK
//
//  Created by Hadevs on 02/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

class InfoUserTableViewCell: UITableViewCell, StaticCellProtocol {
    
    //MARK: -  @IBOutlet
	
	@IBOutlet private weak var backgroundFieldsView: UIView!
	@IBOutlet private weak var photoView: PhotoView!
	@IBOutlet private weak var topTextField: UITextField!
	@IBOutlet private weak var bottomTextField: UITextField!
    
    //MARK: -  copmpyter properties

	static var height: CGFloat {
		return 100
	}
    
    //MARK: -  copmpyter properties(observer)
	
	var photoViewClicked: VoidClosure? {
		didSet {
			photoView.clicked = photoViewClicked
		}
	}
    
    //MARK: -  properties
	
	var topTextChanged: ItemClosure<String>?
	var bottomTextChanged: ItemClosure<String>?
    
    //MARK: -  awakeFromNib()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		Decorator.decorate(cell: self)
		addTargets()
	}
    
    //MARK: -  addTargets()
	
	private func addTargets() {
		topTextField.addTarget(self, action: #selector(topTextFieldChanged(sender:)), for: .editingChanged)
		bottomTextField.addTarget(self, action: #selector(bottomTextFieldChanged(sender:)), for: .editingChanged)
	}
    
    //MARK: -  topTextFieldChanged()
	
	@objc private func topTextFieldChanged(sender: UITextField) {
		topTextChanged?(sender.text ?? "")
	}
    
    //MARK: -  bottomTextFieldChanged()
	
	@objc private func bottomTextFieldChanged(sender: UITextField) {
		bottomTextChanged?(sender.text ?? "")
	}
    
    //MARK: -  set()
	
	func set(image: UIImage?) {
		photoView.set(image: image)
	}
}

//MARK: -  extension InfoUserTableViewCell(Decorator)

extension InfoUserTableViewCell {
	fileprivate class Decorator {
		static func decorate(cell: InfoUserTableViewCell) {
			cell.selectionStyle = .none
			cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
			cell.backgroundFieldsView.layer.borderColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
			cell.backgroundFieldsView.layer.borderWidth = 0.5
		}
	}
}

//
//  PhotoView.swift
//  DKVK
//
//  Created by Hadevs on 02/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

final class PhotoView: UIView {
    
    //MARK: - properties
    
	private let stackView = UIStackView()
	private let plusView = UIImageView()
	private let label = UILabel()
	private let imageView = UIImageView()
	var clicked: VoidClosure?  
	
    //MARK: - didMoveToSuperview()
    
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		Decorator.decorate(self)
		addLabel()
		addPlusView()
		addImageView()
		clipsToBounds = true
	}
    
    //MARK: - touchesEnded()
    
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		
		clicked?()
	}
    
	//MARK: - set()
    
	func set(image: UIImage?) {
		imageView.image = image
		imageView.isHidden = image == nil
	}
    
    //MARK: - addImageView()
	
	private func addImageView() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.isHidden = true
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		addSubview(imageView)
		
		let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[imageView]|,V:|[imageView]|", dict: ["imageView": imageView])
		addConstraints(constraints)
	}
    
    //MARK: - addLabel()
	
	private func addLabel() {
		label.text = "фото"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12)
		label.textAlignment = .center
		label.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
		addSubview(label)
		
		let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[label]|,V:[label]-16-|", dict: ["label": label])
		addConstraints(constraints)
	}
    
    //MARK: - addPlusView()
	
	private func addPlusView() {
		plusView.translatesAutoresizingMaskIntoConstraints = false
		plusView.contentMode = .scaleAspectFit
		plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
		plusView.image = #imageLiteral(resourceName: "add.png")
		addSubview(plusView)
		
		let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[plusView]|,V:|-(>=0)-[plusView(\(frame.height * 0.3))][label]", dict: ["label": label, "plusView": plusView])
		addConstraints(constraints)
	}
    
    //MARK: - layoutSubviews()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		Decorator.layoutSubviews(self)
	}
}

    //MARK: - extension PhotoView(Decorator)

extension PhotoView {
	fileprivate final class Decorator {
		static func decorate(_ view: PhotoView) {
			view.layer.borderColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
			view.layer.borderWidth = 1
		}
		
		static func layoutSubviews(_ view: PhotoView) {
			view.round()
			view.imageView.round()
		}
	}
}

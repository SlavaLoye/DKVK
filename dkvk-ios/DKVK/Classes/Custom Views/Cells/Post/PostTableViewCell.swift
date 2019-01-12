//
//  PostTableViewCell.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//


import UIKit

class PostTableViewCell: UITableViewCell, NibLoadable {
    
     //MARK: - IBOutlet
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

    //MARK: - extension PostTableViewCell (setup)

extension PostTableViewCell {
    func setup(with post: Post) {
        textView.text = post.text ?? ""
        if let imageData = post.imageData {
            postImageView.image = UIImage(data: imageData)
            imageViewHeightConstraint.constant = Sizes.postImageHeight
        } else {
            imageViewHeightConstraint.constant = Sizes.zero
        }
    }
}


    //MARK: - extension PostTableViewCell (Sizes)

private extension PostTableViewCell {
    enum Sizes {
        static let zero: CGFloat = 0
        static let postImageHeight: CGFloat = 300
    }
}

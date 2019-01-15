//
//  SegmenterTableViewCell.swift
//  DKVK
//
//  Created by Hadevs on 10/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

class SegmenterTableViewCell: UITableViewCell, NibLoadable {
    
    //MARK: -  @IBOutlet
	
	@IBOutlet private weak var segmentControl: UISegmentedControl!
	
	var indexChanged: ItemClosure<Int>?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		selectionStyle = .none
		addTargets()
	}
    
    //MARK: -  set()
	
	func set(titles: [String]) {
		segmentControl.removeAllSegments()
		titles.enumerated().forEach { i, title in
			segmentControl.insertSegment(withTitle: title, at: i, animated: true)
		}
		segmentControl.selectedSegmentIndex = 0
	}
    
    //MARK: -  addTargets()
	
	private func addTargets() {
		segmentControl.addTarget(self, action: #selector(segmentControlChangedIndex(sender:)), for: .valueChanged)
	}
	
	@objc private func segmentControlChangedIndex(sender: UISegmentedControl) {
		indexChanged?(sender.selectedSegmentIndex)
	}
}

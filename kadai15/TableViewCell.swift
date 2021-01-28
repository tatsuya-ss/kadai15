//
//  TableViewCell.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let reuseIdentifier = "Cell1"
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var memoLabel: UILabel!
    let Image = UIImage(named: "check")
    
    func configure(isChecked: Bool, name: String) {
        checkImage.image = isChecked ? Image : nil
        memoLabel.text = name
    }
}

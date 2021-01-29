//
//  TableViewCell.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

final class TableViewCell: UITableViewCell {
    static let reuseIdentifier = "Cell1"
    @IBOutlet private weak var checkImage: UIImageView!
    @IBOutlet private weak var memoLabel: UILabel!
    private static let imageview = UIImage(named: "check") // カプセル化する。＋　staticにする事で意図しない変更を防ぐ

    func configure(fruit: Fruit) { // 構造体を定義として扱っている。引数fruitをFruit型に指定して使う
        checkImage.image = fruit.isChecked ? TableViewCell.imageview : nil
        memoLabel.text = fruit.name
    }

//    func configure(isChecked: Bool, name: String) {
//        checkImage.image = isChecked ? TableViewCell.imageview : nil
//        memoLabel.text = name
//    }
}

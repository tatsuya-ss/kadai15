//
//  fruits.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import Foundation

struct Fruit {
    var name: String = ""
    var isChecked: Bool = false

    func dictionary() -> [String: Any] {
        let KeyName = "Name"
        let KeyCheck = "isChecked"

        return [KeyName: name, KeyCheck: isChecked]
    }
}

//
//  AddViewController.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

final class AddViewController: UIViewController {
    @IBOutlet weak private var addText: UITextField!
    var fruitAdd: [String: Any] = [:]

    @IBAction private func saveButton(_ sender: Any) {
        var fruits = Fruit()
        fruits.name = addText.text!
        fruitAdd = fruits.dictionary()
        performSegue(withIdentifier: "exit", sender: nil)
    }
}

//
//  ChangeViewController.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/31.
//

import UIKit

class ChangeViewController: UIViewController {
    @IBOutlet weak private var changeTextLabel: UITextField!
    private(set) var change = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction private func changeSaveButton(_ sender: Any) {
        change = changeTextLabel.text ?? ""
        performSegue(withIdentifier: "change", sender: nil)
    }
}

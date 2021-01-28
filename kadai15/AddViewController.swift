//
//  AddViewController.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var addText: UITextField!
    var fruitAdd: Dictionary<String,Any> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        var fruits = fruit()
        fruits.name = addText.text!
        fruitAdd = fruits.dictionary()
        performSegue(withIdentifier: "exit", sender: nil)
    }
    

}

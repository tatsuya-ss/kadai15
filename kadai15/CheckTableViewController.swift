//
//  CheckTableViewController.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

class CheckTableViewController: UITableViewController {
    
    var fruits = [
        ["Name": "りんご", "isChecked": true],
        ["Name": "ばなな", "isChecked": false],
        ["Name": "みかん", "isChecked": true],
        ["Name": "パイナップル", "isChecked": false]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        fruits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        let fruit = fruits[indexPath.row]
        
        cell.configure(isChecked: fruit["isChecked"] as! Bool, name: fruit["Name"] as! String)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let fruitCheck = self.fruits[indexPath.row]["isChecked"] as? Bool else {
            return
        }
        self.fruits[indexPath.row]["isChecked"] = !fruitCheck
        print(self.fruits)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        let addVC = segue.source as! AddViewController
        fruits.append(addVC.fruitAdd)
        tableView.reloadData()
    }
    
}

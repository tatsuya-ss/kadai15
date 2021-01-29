//
//  CheckTableViewController.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

final class CheckTableViewController: UITableViewController {
    private var fruits = [  // ここで構造体Fruitを初期化して使用してる。
        Fruit(name: "りんご", isChecked: true),
        Fruit(name: "ばなな", isChecked: false),
        Fruit(name: "みかん", isChecked: true),
        Fruit(name: "パイナップル", isChecked: false)
    ]

//    private var fruits = [
//        ["Name": "りんご", "isChecked": true],
//        ["Name": "ばなな", "isChecked": false],
//        ["Name": "みかん", "isChecked": true],
//        ["Name": "パイナップル", "isChecked": false]
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell

        cell.configure(fruit: fruits[indexPath.row])  // configure()はnameとisCheckedを使って定義されているので、fruis[indexPath.row]を打ち込むだけ

//        let fruit = fruits[indexPath.row]
//        cell.configure(isChecked: fruit["isChecked"] as! Bool, name: fruit["Name"] as! String)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var fruit = fruits[indexPath.row]
        fruit.isChecked.toggle()  // toggle()でBool値の反転を行う！すご！！！
        fruits[indexPath.row] = fruit

//        guard let fruitCheck = self.fruits[indexPath.row]["isChecked"] as? Bool else {
//            return
//        }
//        self.fruits[indexPath.row]["isChecked"] = !fruitCheck
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    @IBAction private func cancel(segue: UIStoryboardSegue) {
    }

    @IBAction private func exit(segue: UIStoryboardSegue) {
        let addVC = segue.source as! AddViewController
        guard let fruit = addVC.fruitAdd else {return}
        fruits.append(fruit)
//        fruits.append(addVC.fruitAdd)
        tableView.reloadData()
    }
}

//
//  CheckTableViewController.swift
//  kadai15
//
//  Created by 坂本龍哉 on 2021/01/26.
//

import UIKit

final class CheckTableViewController: UITableViewController {
    private var fruits = [
        Fruit(name: "りんご", isChecked: true),
        Fruit(name: "ばなな", isChecked: false),
        Fruit(name: "みかん", isChecked: true),
        Fruit(name: "パイナップル", isChecked: false)
    ]

    private var changeIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell

        cell.configure(fruit: fruits[indexPath.row])  // configure()はnameとisCheckedを使って定義されているので、fruis[indexPath.row]を入れるだけ

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var fruit = fruits[indexPath.row]
        fruit.isChecked.toggle()  // toggle()でBool値の反転を行う！
        fruits[indexPath.row] = fruit

        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        changeIndex = indexPath.row
        performSegue(withIdentifier: TableViewCell.datailReuseIdentifier, sender: nil)
    }

    @IBAction private func change(segue: UIStoryboardSegue) {
        let changeVC = segue.source as! ChangeViewController
        fruits[changeIndex] = Fruit(name: changeVC.change, isChecked: fruits[changeIndex].isChecked)  // isCheckedはそのまま
        tableView.reloadData()
    }

    @IBAction private func cancel(segue: UIStoryboardSegue) {
    }

    @IBAction private func exit(segue: UIStoryboardSegue) {
        let addVC = segue.source as! AddViewController
        guard let fruit = addVC.fruitAdd else {return}
        fruits.append(fruit)
        tableView.reloadData()
    }
}

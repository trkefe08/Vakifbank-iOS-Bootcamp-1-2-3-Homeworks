//
//  ListViewController.swift
//  zooManagement
//
//  Created by Tarik Efe on 19.11.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var animalArray = [String]()
    var sitterArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.sitterLabel.text = sitterArray[indexPath.row]
        cell.animalLabel.text = animalArray[indexPath.row]
        return cell
    }
}

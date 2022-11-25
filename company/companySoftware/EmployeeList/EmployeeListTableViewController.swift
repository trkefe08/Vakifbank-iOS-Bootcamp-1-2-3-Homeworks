//
//  EmployeeListTableViewController.swift
//  companySoftware
//
//  Created by Tarik Efe on 14.11.2022.
//

import UIKit

class EmployeeListTableViewController: UIViewController {

    @IBOutlet weak var employeeListTableView: UITableView!
    var nameList = [String]()
    var idList = [String]()
    var searchList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeListTableView.dataSource = self
        employeeListTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            let search = UISearchController(searchResultsController: nil)
            search.searchResultsUpdater = self
            search.searchBar.placeholder = "Type something to search"
            navigationItem.searchController = search
            navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension EmployeeListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = employeeListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = nameList[indexPath.row]
        cell.idLabel.text = idList[indexPath.row]
        return cell
    }
}

extension EmployeeListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        searchList = nameList.filter({ $0 == text })
        if text == "" {
            searchList = nameList
        }
        employeeListTableView.reloadData()
    }
}




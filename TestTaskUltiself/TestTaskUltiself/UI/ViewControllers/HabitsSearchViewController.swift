//
//  HabitsSearchViewController.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import UIKit

class HabitsSearchViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var models = [HabitModelDTO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()
    }
    
    // MARK: - Configuration
    private func configureTableView() {
        tableView.allowsSelection = false
        tableView.register(cellType: HabitTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    }
}

// MARK: - UITableViewDataSource
extension HabitsSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(cellType: HabitTableViewCell.self)
        let index = indexPath.row
        let habit = models[index]
        cell.configure(cellNumber: index + 1, habit: habit)
        return cell
    }
}

// MARK: - UITableViewDataSource
extension HabitsSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Searching ", searchBar.text ?? "", " ...")
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel pressed")
    }
}

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
    
    private var habitsService: HabitsFetchService!
    
    private var models = [HabitModelDTO]()
    private var currentQuery: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHabitsService()
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
    
    private func configureHabitsService() {
        habitsService = HabitsFetchService(delegate: self)
    }
    
    // MARK: - Actions
    private func updateView(with data: [HabitModelDTO]) {
        models = data
        tableView.reloadData()
    }
}

// MARK: - UITableViewD ataSource
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

// MARK: - UISearchBar Delegate
extension HabitsSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let query = searchBar.text else { return }
        currentQuery = query
        habitsService.fetchData(for: query)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = currentQuery
    }
}

// MARK: - HabbitFetchService Delegate
extension HabitsSearchViewController: HabitsFetchServiceDelegate {
    func dataUpdatedSuccessful(data: [HabitModelDTO], service: HabitsFetchService) {
        updateView(with: data)
    }
    
    func dataUpdateFailure(error: Error, service: HabitsFetchService) {
        displayAlert(with: error)
    }
}

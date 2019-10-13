//
//  TasksViewController+UITableViewExtension.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

final class TaskDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var viewModel: TasksViewModel!
    private var tableView: UITableView!
    convenience init(with viewModel: TasksViewModel, tableView: UITableView) {
        self.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.viewModel = viewModel
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoTitleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TasksTableViewCell else { return UITableViewCell() }
        
        let item = viewModel.todoTitleList[indexPath.row]
        cell.configure(title: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        viewModel.deleteTask(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

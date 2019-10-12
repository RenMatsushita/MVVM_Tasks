//
//  TasksViewController.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    @IBOutlet private weak var tasksTableView: UITableView!
    @IBOutlet weak var taskTextField: UITextField!
    
    private var viewModel = TasksViewModel()
    private lazy var dataSource = TaskDataSource(with: self.viewModel, tableView: self.tasksTableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = dataSource
        taskTextField.delegate = self
    
        self.configure()
               
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadHandler), name: .reloadData, object: nil)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)

        tasksTableView.isEditing = editing
    }
    
    @objc func reloadHandler() {
        tasksTableView.reloadData()
    }
    
    private func configure() {
        navigationItem.leftBarButtonItem = editButtonItem
        tasksTableView.rowHeight = 70
    }
}


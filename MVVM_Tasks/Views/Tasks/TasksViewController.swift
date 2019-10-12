//
//  TasksViewController.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    @IBOutlet private weak var tasksTableView: UITableView! {
        didSet {
            
            tasksTableView.dataSource = self
        }
    }
    
    @IBOutlet weak var taskTextField: UITextField! {
        didSet {
            taskTextField.delegate = self
        }
    }
    
    var viewModel = TasksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        
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


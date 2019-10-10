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
    @IBOutlet private weak var taskTextField: UITextField!
    
    lazy var viewModel = TasksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        taskTextField.delegate = self
        
        tasksTableView.rowHeight = 70
        tasksTableView.dataSource = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tasksTableView.isEditing = editing
    }
}

extension TasksViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let taskTitle = taskTextField.text else { return true }
        guard taskTitle.count != 0 else {
            textField.resignFirstResponder()
            return true
        }
        viewModel.setTask(title: taskTitle)
        tasksTableView.reloadData()
        textField.resignFirstResponder()
        return true
    }
}




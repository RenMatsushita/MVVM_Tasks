//
//  TasksViewModel.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

class TasksViewModel {
    
    let model = TodoModel()
    
    var todoTitleList: [String] {
        guard let tasks = model.getTasks() else {
            return ["タスクを追加してください"]
        }
        return tasks
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.addTask), name: .textFieldReturn, object: nil)
    }
    
    @objc func addTask(notification: Notification) {
        if let userInfo = notification.userInfo {
            let taskTitle = userInfo["taskTitle"] as! String
            
            if taskTitle.count != 0 {
                model.setTask(taskTitle: taskTitle)
                NotificationCenter.default.post(Notification(name: .reloadData))
            }
        }
    }
    
    func setTask(title newTaskTitle: String) {
        model.setTask(taskTitle: newTaskTitle)
    }
    
    func deleteTask(index: Int) {
        model.deleteTask(index: index)
    }
}

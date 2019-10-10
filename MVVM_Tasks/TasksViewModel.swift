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
        return model.getTask()
    }
    
    func setTask(title newTaskTitle: String) {
        model.setTask(taskTitle: newTaskTitle)
    }
    
    func deleteTask(index: Int) {
        model.deleteTask(index: index)
    }
}

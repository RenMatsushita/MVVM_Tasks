//
//  TasksModel.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

class TodoModel {
    
    private let userDefaults = UserDefaults.standard
    
    func getTask() -> [String] {
        guard let tasks = self.userDefaults.array(forKey: "tasks") as? [String] else { return ["タスクを入力してください"] }
        return tasks
    }
    
    func setTask(taskTitle newTaskTitle: String) {
        var taskTitleList: [String] = self.getTask()
        taskTitleList.append(newTaskTitle)
        self.userDefaults.set(taskTitleList, forKey: "tasks")
    }
    
    func deleteTask(index: Int) {
        var taskTitleList: [String] = self.getTask()
        taskTitleList.remove(at: index)
        self.userDefaults.set(taskTitleList, forKey: "tasks")
    }
}

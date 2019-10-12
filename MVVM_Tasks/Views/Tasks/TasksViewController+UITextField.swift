//
//  TasksViewController+UITextField.swift
//  MVVM_Tasks
//
//  Created by Ren Matsushita on 2019/10/12.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

extension TasksViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let taskTitle = taskTextField.text else { return true }
        NotificationCenter.default.post(name: .textFieldReturn, object: nil, userInfo: ["taskTitle": taskTitle])
        taskTextField.text = ""
        textField.resignFirstResponder()
        return true
    }
}

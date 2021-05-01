//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

class Client {
    var grade: String
    var priority: Int
    var waitingNumber: Int
    var taskType: String

    init(grade: String, priority: Int, waitingNumber: Int, taskType: String) {
        self.grade = grade
        self.priority = priority
        self.waitingNumber = waitingNumber
        self.taskType = taskType
    }
}



//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

class Banker: Operation {
    let bankerNumber: Int
    let client: Client?
    let notification: NSNotification.Name
    
    
    init(bankerNumber: Int, client: Client? , notification: NSNotification.Name) {
        self.bankerNumber = bankerNumber
        self.client = client
        self.notification = notification
    }
    
    override func main() {
        var businessTime: Float = 0
        if let client = self.client {
            print("\(client.waitingNumber)번 \(client.grade) \(client.taskType) 업무 시작")
            businessTime = setBusinessTime(taskType: client.taskType)
            Thread.sleep(forTimeInterval: Double(businessTime))
            print("\(client.waitingNumber)번 \(client.grade) \(client.taskType) 업무 완료")
        }
        NotificationCenter.default.post(name: notification, object: nil, userInfo: ["bankerNumber": bankerNumber, "notificationNumber": notification,"businessTime": businessTime])
    }
    
    private func setBusinessTime(taskType: String) -> Float {
        if taskType == "대출" {
            return 1.1
        }
        return 0.7
    }
}

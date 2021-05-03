//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/05/02.
//

import Foundation

class HeadOffice {
    let lock: NSLock?
    init(lock: NSLock?) {
        self.lock = lock
    }
    @objc func checkLoanRequest(notification: Notification) {
        guard let userInformation = notification.userInfo else { return }
        guard let banker = userInformation["banker"] as? Banker, let client = userInformation["client"] as? Client else { return }
        lock?.lock()
        print("\(client.waitingNumber)번 \(client.grade) \(client.taskType)심사 시작")
        updateBusinessTime(banker: banker, time: 0.5)
        banker.operationQueue.isSuspended = false
        print("\(client.waitingNumber)번 \( client.grade) \(client.taskType)심사 완료")
        lock?.unlock()
    }
    
    private func updateBusinessTime(banker: Banker, time: Float) {
        banker.businessTime += time
        Thread.sleep(forTimeInterval: Double(time))
    }
}



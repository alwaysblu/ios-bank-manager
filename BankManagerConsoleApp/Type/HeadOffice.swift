//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/05/02.
//

import Foundation
// 본사의 대출심사는 0.5초 소요됨

// 본사는 한 번에 한 대출만 심사할 수 있음

// 심사 중에 요청이 들어온 경우 지금의 심사를 모두 마친 후에
// 해당 심사를 요청한 은행원에게 결과를 알린 후에 다음 심사를 진행함

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



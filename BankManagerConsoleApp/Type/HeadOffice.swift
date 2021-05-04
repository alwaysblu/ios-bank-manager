//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/05/02.
//

import Foundation

class HeadOffice { //은행은 본사가 따로 존재합니다
    let lock = NSLock()
    @objc func checkLoanRequest(notification: Notification) {
        guard let userInformation = notification.userInfo else { return }
        guard let banker = userInformation[UserInformationKey.banker] as? Banker, let client = userInformation[UserInformationKey.client] as? Client else { return }
        let clientGrade = banker.convertGradeToString(grade: client.grade)
        lock.lock() //본사는 한 번에 한 대출만 심사할 수 있습니다
        print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)심사 시작")
        banker.updateBusinessTime(time: 0.5) //본사의 대출심사는 0.5초가 걸립니다
        banker.operationQueue.isSuspended = false
        print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)심사 완료")
        lock.unlock() //심사 중에 요청이 들어온 경우 지금의 심사를 모두 마치고 요청 은행원에게 심사 결과를 알린 후 다음 심사를 진행합니다
    }
}



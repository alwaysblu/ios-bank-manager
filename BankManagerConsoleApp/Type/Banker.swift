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
    var businessTime: Float = 0
    let operationQueue = OperationQueue()
    let headOffice: HeadOffice
    
    
    init(bankerNumber: Int, client: Client?, notification: NSNotification.Name, headOffice: HeadOffice) {
        self.bankerNumber = bankerNumber
        self.client = client
        self.notification = notification
        self.headOffice = headOffice
    }
    
    override func main() {
        if let client = self.client {
            let clientGrade = convertGradeToString(grade: client.grade)
            print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)업무 시작")
            setBusinessTime(taskType: client.taskType, client: client)
            print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)업무 완료") // 대출을 실행하면 대출 업무가 끝납니다
        }
        NotificationCenter.default.post(name: notification, object: nil, userInfo: [UserInformationKey.bankerNumber: bankerNumber, UserInformationKey.notificationNumber: notification,UserInformationKey.businessTime: businessTime])
    }
    
    private func setBusinessTime(taskType: String, client: Client) {
        if taskType == ClientTask.loan {
            let loanNotification = Notification.Name("\(client.waitingNumber)th loanNotification")
            NotificationCenter.default.addObserver(headOffice, selector: #selector(HeadOffice.checkLoanRequest(notification:)), name: loanNotification, object: nil)
            updateBusinessTime(time: 0.3) // 은행원은 고객의 서류를 검토하는데 0.3초가 걸립니다
            requestLoan(notification: loanNotification, client: client) //서류를 검토하면 본사로 대출 승인을 요청합니다
            updateBusinessTime(time: 0.3) // 승인 응답을 받으면 고객에게 대출을 실행하는데 0.3초가 걸립니다
            NotificationCenter.default.removeObserver(headOffice, name: notification, object: nil)
            return
        }
        updateBusinessTime(time: 0.7)
        return
    }
    
    
    private func requestLoan(notification: NSNotification.Name, client: Client) {
        self.operationQueue.isSuspended = true
        NotificationCenter.default.post(name: notification, object: nil, userInfo: [UserInformationKey.banker: self, UserInformationKey.client: client])
        operationQueue.addOperation {}
        operationQueue.waitUntilAllOperationsAreFinished()//본사의 대출 승인 응답이 올 때 까지 은행원은 대기해야합니다
    }
    
    func updateBusinessTime(time: Float) {
        self.businessTime += time
        Thread.sleep(forTimeInterval: Double(time))
    }
    
    func convertGradeToString(grade: Int) -> String {
            switch grade {
            case 1:
                return ClientGrade.vvip
            case 2:
                return ClientGrade.vip
            default:
                return ClientGrade.general
            }
        }
}

//
//  failcode.swift
//  Programmers_카카오2019_오픈채팅방
//
//  Created by youngjun goo on 2019/11/02.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

//import Foundation
//
//func fail(_ record:[String]) -> [String] {
//    var answer: [String] = []
//    var view: [User] = []
//    var logDic: [String: String] = [:]
//    
//    record.forEach { (log) in
//        let logInfo = log.split(separator: " ")
//        // Enter, Leave, Change
//        if logInfo[0] == "Enter" {
//            
//            for i in 0..<view.count {
//                if String(logInfo[1]) == view[i].id {
//                    view[i].name = String(logInfo[2])
//                }
//            }
//            // hash 삽입
//            view.append(User(info: String(logInfo[0]), id: String(logInfo[1]), name: String(logInfo[2])))
//            guard let name = logDic[String(logInfo[1])] else {
//                logDic[String(logInfo[1])] = String(logInfo[2])
//                return
//            }
//            // 이름이 다르면 hash update
//            if name != String(logInfo[2]) {
//                logDic.updateValue(String(logInfo[2]), forKey: String(logInfo[1]))
//            }
//            
//        } else if logInfo[0] == "Leave" {
//            let name = logDic[String(logInfo[1])]
//            
//            view.append(User(info: String(logInfo[0]), id: String(logInfo[1]), name: name!))
//        } else {
//            for i in 0..<view.count {
//                if logInfo[1] == view[i].id {
//                    view[i].name = String(logInfo[2])
//                }
//            }
//        }
//    }
//    
//    view.forEach { (user) in
//        if user.info == "Enter" {
//            answer.append("\(user.name)님이 들어왔습니다.")
//        } else if user.info == "Leave" {
//            answer.append("\(user.name)님이 나갔습니다.")
//        }
//    }
//    
//    
//    
//    return answer
//}
//
//
//struct User {
//    var id: String
//    var name: String
//    var info: String
//    
//    init(info: String, id: String, name: String) {
//        self.id = id
//        self.name = name
//        self.info = info
//    }
//}

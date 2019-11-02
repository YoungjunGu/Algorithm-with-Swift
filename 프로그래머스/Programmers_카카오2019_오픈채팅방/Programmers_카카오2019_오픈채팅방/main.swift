//
//  main.swift
//  Programmers_카카오2019_오픈채팅방
//
//  Created by youngjun goo on 2019/11/02.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

enum Action {
    case enter, leave, change, unkown
    static func fromString(_ command: String) -> Action {
        switch command.lowercased() {
        case "enter": return .enter
        case "leave": return .leave
        case "change": return .change
        default: return .unkown
        }
    }
}

struct User {
    var id = ""
    var name = ""
}

struct Record {
    var action: Action
    var id = ""
}

func solution(_ record:[String]) -> [String] {
    var users: [String: User] = [:]

    func stringToRecord(_ line: String) -> Record {
        let parsed = line.split(separator: " ")
        let command = String(parsed[0])
        let uid = String(parsed[1])
        return Record(action: Action.fromString(command), id: uid)
    }

    func registUser(_ line: String) {
        let parsed = line.split(separator: " ")
        guard parsed.count > 2 else { return }
        let uid = String(parsed[1])
        let name = String(parsed[2])
        if var user = users[uid] {
            user.name = name
            users[uid] = user
        } else {
            users[uid] = User(id: uid, name: name)
        }
    }

    func recordToString(_ r: Record) -> String? {
        guard let user = users[r.id] else { return nil }
        switch r.action {
        case .enter: return "\(user.name)님이 들어왔습니다."
        case .leave: return "\(user.name)님이 나갔습니다."
        default: return nil
        }
    }

    record.forEach(registUser)
    return record.map(stringToRecord)
        .map(recordToString)
        .filter({ $0 != nil })
        .map({ $0! })
}



let record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Muzi", "Change uid4567 Ryan", "Enter uid1231 Muzi", "Change uid1234 Con"]

print(solution(record))



//
//  main.swift
//  Programmers_카카오2018_추석트래픽
//
//  Created by youngjun goo on 2019/11/05.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ lines:[String]) -> Int {
    
    var timeLogs = [(start: Date, end: Date)]()
    var timeStamps = [Date]()
    
    // 시작 시간 과 종료 시간을 구함
    // timeLogs : 시작과 종료가 담긴 배열
    // 시작과 종료를 각각 넣어 기록한 배열
    extractTime(lines, &timeLogs, &timeStamps)
    
    let maxProcessCount = getMaximunProcessing(timeLogs, timeStamps)
    
    return maxProcessCount
}

func extractTime(_ lines: [String],
                 _ timeLogs: inout [(start: Date, end: Date)],
                 _ timeStamps: inout [Date])
{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyy-MM-dd HH:mm:ss.SSS"
    
    lines.forEach { log in
        let logList = log.split(separator: " ")
        let day = logList[0]
        let time = logList[1]
        
        if let endDate = formatter.date(from: String("\(day) \(time)")), let processTime = Double(logList[2].dropLast()) {
            let startDate = endDate.addingTimeInterval(-processTime + 0.001)
            timeLogs.append((startDate, endDate))
            timeStamps.append(startDate)
            timeStamps.append(endDate)
        }
    }

}

func getMaximunProcessing(_ timeLogs: [(start: Date, end: Date)],
                          _ timeStamp: [Date]) -> Int
{
    var maxProcessCount = 0
    for i in 0..<timeStamp.count {
        var cnt = 0
        for j in 0..<timeLogs.count
            where timeLogs[j].start <= timeStamp[i].addingTimeInterval(0.999) && timeLogs[j].end >= timeStamp[i]
        {
            cnt += 1
        }
        if maxProcessCount < cnt {
            maxProcessCount = cnt
        }
    }
    
    return maxProcessCount
}

let lines = [
"2016-09-15 20:59:57.421 0.351s",
"2016-09-15 20:59:58.233 1.181s",
"2016-09-15 20:59:58.299 0.8s",
"2016-09-15 20:59:58.688 1.041s",
"2016-09-15 20:59:59.591 1.412s",
"2016-09-15 21:00:00.464 1.466s",
"2016-09-15 21:00:00.741 1.581s",
"2016-09-15 21:00:00.748 2.31s",
"2016-09-15 21:00:00.966 0.381s",
"2016-09-15 21:00:02.066 2.62s"
]

print(solution(lines))

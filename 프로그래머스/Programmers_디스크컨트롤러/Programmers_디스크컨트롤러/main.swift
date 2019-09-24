//
//  main.swift
//  Programmers_디스크컨트롤러
//
//  Created by youngjun goo on 24/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    
    var sortedJob = jobs.sorted { (first, second) -> Bool in
        if first[1] < second[1] {
            return true
        } else if first[1] == second[1] {
            if first[0] < second[0] {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    print(sortedJob)
    var time: Int = 0
    var total : Int = 0
    while sortedJob.count > 0 {
        for i in 0..<sortedJob.count {
            
            // 시작시간이 충분히 넘은 경우
            if sortedJob[i][0] <= time {
                time = time + sortedJob[i][1]
                total = total + time - sortedJob[i][0]
                sortedJob.remove(at: i)
                break;
            }
            if i == sortedJob.count - 1 {
                time = time + 1
            }
            
        }
    }

    let average = total / jobs.count
    
    return average
    
}

let jobs = [[0, 3], [1, 9], [500, 6]]

print(solution(jobs))


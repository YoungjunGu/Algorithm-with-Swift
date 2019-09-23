//
//  main.swift
//  Programmers_입국심사
//
//  Created by youngjun goo on 23/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {

    guard let maxInTimes = times.max() else { return 0 }

    var left: Int64 = 0
    var right: Int64 = Int64(maxInTimes * n)
    var mid: Int64 = (left + right) / 2
    var answer: Int64 = right
    
    while left <= right {
        mid = (left + right) / 2
        var possible: Int64 = 0
        for time in times {
            possible = possible + Int64((Int(mid) / time))
        }
        // n보다 작을 경우 해당 mid 값 보단 더 커야한다.
        if possible >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return answer
}


let n = 6
let times = [7,10]

print(solution(n, times))

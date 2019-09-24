//
//  main.swift
//  Programmers_이중우선순위큐
//
//  Created by youngjun goo on 24/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var answer: [Int] = [0,0]
    var pq: [Int] = []
    
    for operation in operations {
        let inputString = operation.components(separatedBy: " ")
        let menu = inputString[0]
        let num = Int(inputString[1])!
        
        if menu == "I" {
            pq.append(num)
        }
        else if menu == "D" {
            if pq.count > 0 {
                if num == 1 {
                    // 최댓값 삭제
                    pq.remove(at: 0)
                } else {
                    // 최솟값 삭제
                    pq.remove(at: pq.count - 1)
                }
            }
        }
        pq.sort(by: { $0 > $1 })
    }
    
    if pq.count > 0 {
        answer.removeAll()
        answer.append(pq.first!)
        answer.append(pq.last!)
    }

    return answer
}

var operations: [String] = ["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]

print(solution(operations))

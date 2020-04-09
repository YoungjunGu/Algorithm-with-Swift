//
//  main.swift
//  Programmers_숫자게임
//
//  Created by youngjun goo on 2019/12/14.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var score = 0
    var sortA = a.sorted()
    var sortB = b.sorted()
    
    for i in 0..<a.count {
        for j in 0..<a.count {
            if sortA[i] < sortB[j] {
                score += 1 
                sortB.remove(at: j)
                break
            }
        }
    }
    
    return score
}



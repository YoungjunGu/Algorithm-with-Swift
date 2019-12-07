//
//  main.swift
//  Programmers_탑
//
//  Created by youngjun goo on 2019/11/28.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ heights:[Int]) -> [Int] {
    var answer: [Int] = []
    for i in 0..<heights.count {
        let curHeight = heights[i]
        var flag = false
        for j in (0..<i).reversed() {
            if curHeight < heights[j] {
                answer.append(j+1)
                flag = true
                break
            }
        }
        if !flag { answer.append(0) }
    }
    
    return answer
}


let heights = [3,9,9,3,5,7,2]

print(solution(heights))

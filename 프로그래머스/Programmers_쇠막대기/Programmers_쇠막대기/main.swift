//
//  main.swift
//  Programmers_쇠막대기
//
//  Created by youngjun goo on 2019/10/23.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ arrangement:String) -> Int {
    var count: Int = 0
    var stack: [String] = []
    let replacingArr = arrangement.replacingOccurrences(of: "()", with: "0")
    print(replacingArr)
    replacingArr.forEach { (element) in
        if element == ")" && !stack.isEmpty {
            _ = stack.popLast()
        }
        else if element == "0" && !stack.isEmpty {
            count += stack.count
        }
        else if element == "(" {
            stack.append("(")
            count += 1
        }
        
    }
    
    return count
}


let arrangement = "()(((()())(())()))(())"

print(solution(arrangement))



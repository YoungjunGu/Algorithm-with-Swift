//
//  main.swift
//  Programmers_큰수만들기
//
//  Created by youngjun goo on 2019/10/23.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation



func solution(_ number:String, _ k:Int) -> String {
    let numbers: [Character] = number + []
    var str = [Int](repeating: 0 , count: numbers.count - k)
    var list: [Int] = []
    combination(numbers, numbers.count - k, str: &str, target: 0, n: numbers.count, index: 0, list: &list)
    
    let max: Int = list.max()!
    
    return String(max)
}

func combination(_ number:[Character],_ k: Int, str: inout [Int], target: Int, n: Int, index: Int, list: inout [Int]) {
    if k == 0 {
        print(str)
        var comStr = ""
        for i in str {
            comStr += String(number[i])
        }
        list.append(Int(comStr)!)
    }
    else if target == n {
        return
    }
    else {
        str[index] = target
        combination(number, k - 1, str: &str, target: target + 1, n: n, index: index + 1, list: &list)
        combination(number, k, str: &str, target: target + 1, n: n, index: index, list: &list)
    }
    
}


let number = "4177252841"
let k = 4

print(solution(number, k))


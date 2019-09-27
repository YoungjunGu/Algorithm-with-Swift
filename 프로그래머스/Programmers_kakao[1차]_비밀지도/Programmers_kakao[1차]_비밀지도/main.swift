//
//  main.swift
//  Programmers_kakao[1차]_비밀지도
//
//  Created by youngjun goo on 27/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        var rowStr = ""
        let key1: [Character] = [] + getBinaryString(arr1[i], n)
        let key2: [Character]  = [] +  getBinaryString(arr2[i], n)
        
        for j in 0..<n {
            if key1[j] == "0" && key2[j] == "0" {
                rowStr = rowStr + " "
            } else {
                rowStr = rowStr + "#"
            }
        }
        answer.append(rowStr)
    }
    
    return answer
}

func getBinaryString(_ num: Int, _ n: Int) -> String {

    var binary = ""
    var temp = num
    
    while temp >= 1 {
        if temp % 2 == 0 {
            binary = "0" + binary
        } else {
            binary = "1" + binary
        }
        temp /= 2
    }
    
    if binary.count < n {
        for _ in 0..<n - binary.count {
            binary = "0" + binary
        }
    }
    return binary
}



let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]
let n = 5

print(solution(5, arr1, arr2))

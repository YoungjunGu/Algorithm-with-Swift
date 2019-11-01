//
//  main.swift
//  Programmers_위장
//
//  Created by youngjun goo on 2019/11/01.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var dic: [String: Int] = [:]
    var set: Set<String> = []
    var answer: Int = 1
    clothes.forEach { (elements) in
        guard let count = dic[elements[1]] else {
            dic[elements[1]] = 1
            set.insert(elements[1])
            return
        }
        dic[elements[1]] = count + 1
    }
    
    set.forEach { (cloth) in
        answer *= (dic[cloth]! + 1)
    }
    
//    for value in dic.values {
//        answer *= (value + 1)
//    }
    
    return answer - 1
}


let clothes = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]


print(solution(clothes))

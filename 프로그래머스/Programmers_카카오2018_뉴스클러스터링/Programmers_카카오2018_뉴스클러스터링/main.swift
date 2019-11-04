//
//  main.swift
//  Programmers_카카오2018_뉴스클러스터링
//
//  Created by youngjun goo on 2019/11/04.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    var setA: [String: Int] = [:]
    var setB: [String: Int] = [:]
    
    setA = getMultiSet(str1)
    setB = getMultiSet(str2)
    
    let js = Int(jacardSimilarity(setA, setB))
    
    return js
}

func jacardSimilarity(_ setA: [String: Int], _ setB: [String: Int]) -> Double {
    var A = setA
    var B = setB
    var intersetcion = 0
    var union = 0
    
    if setA.isEmpty && setB.isEmpty {
        return 65536
    }
    
    A.forEach { (str, cnt) in
        if B[str] != nil {
            intersetcion += min(cnt, B[str]!)
            union += max(cnt, B[str]!)
            A.removeValue(forKey: str)
            B.removeValue(forKey: str)
        }
    }
    
    A.forEach { union += $1 }
    B.forEach { union += $1 }

    return Double(intersetcion)/Double(union) * 65536
}

func getMultiSet(_ str: String) -> [String: Int] {
    let alphabet = "abcdefghijklmnopqrstuvwxyz".map{ String($0) }
    var set: [String: Int] = [:]
    let strList = str.map { String($0) }
    for i in 0..<strList.count-1 {
        let a = strList[i].lowercased()
        let b = strList[i+1].lowercased()
        if alphabet.contains(a) && alphabet.contains(b) {
            if set[a+b] == nil {
                set[a+b] = 1
            } else {
                set[a+b]! += 1
            }
        }
    }
    return set
}


print(solution("E=M*C^2", "e=m*c^2"))

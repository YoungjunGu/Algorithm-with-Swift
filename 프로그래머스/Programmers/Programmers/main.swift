//
//  main.swift
//  Programmers
//
//  Created by youngjun goo on 27/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> String {
    var answer = ""
    for i in 0..<n {
        if i % 2 != 0 {
            answer += "박"
        } else {
            answer += "수"
        }
    }
    
    return answer
}

// showt coding
//func solution(_ n:Int) -> String {
//    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
//}


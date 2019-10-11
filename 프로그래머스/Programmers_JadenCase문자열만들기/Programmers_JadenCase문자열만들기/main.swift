//
//  main.swift
//  Programmers_JadenCase문자열만들기
//
//  Created by youngjun goo on 2019/10/11.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


func solution(_ s:String) -> String {
    
    var chr: [Character] = []
    let str: [Character] = s + []
    
    for i in 0..<str.count {
        if i == 0 {
            chr.append(Character(str[i].uppercased()))
        }
        if i != 0 {
            if str[i - 1] == " " {
                chr.append(Character(str[i].uppercased()))
            } else {
                chr.append(Character(str[i].lowercased()))
            }
        }
    }
    return String(chr)
}

let s = "3people unFollowed me"
print(solution(s))

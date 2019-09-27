//
//  shortCoding.swift
//  Programmers_kakao[1차]_비밀지도
//
//  Created by youngjun goo on 27/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in 0..<n{
        var data = UInt16(arr1[i]) | UInt16(arr2[i])
        answer.append("")
        for _ in 0..<n{
            if data & 0b00000001 == 1{
                answer[i] = "#" + answer[i]
            }else{
                answer[i] = " " + answer[i]
            }
            data = data >> 1
        }
    }
    return answer
}

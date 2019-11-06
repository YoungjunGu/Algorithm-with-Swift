//
//  main.swift
//  Programmers_2020카카오_문자열압축
//
//  Created by youngjun goo on 2019/11/06.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var min: Int = 987654321
    for i in 1...s.count {
        let compressionCount = getStringCompressionCount(s, i)
        if min > compressionCount {
            min = compressionCount
        }
    }
    
    return min
}


// unit: 자르는 단위의 개수
func getStringCompressionCount(_ s: String, _ unit: Int) -> Int {
    
    if unit == s.count { return s.count }
    
    let str: [String] = s.map{ String($0) }
    // 지금까지 처리한 문자열의 양
    var curUnit: String = ""
    var compressionStr: String = ""
    var sameCnt: Int = 0
    var remainIndex: Int = 0
    for i in  stride(from: 0, to: str.count, by: unit) {
        if i+unit > str.count {
            remainIndex = i
            break
        }
        let curStr = str[i..<i+unit].joined()
        if curStr == curUnit {
            sameCnt += 1
        } else {
            if curUnit == "" {
                curUnit = curStr
            } else if sameCnt == 0 && curUnit != "" {
                compressionStr += curStr
            } else {
                compressionStr += "\(sameCnt+1)\(curUnit)"
            }
            curUnit = curStr
            sameCnt = 0
        }
    }

    if sameCnt != 0 {
        compressionStr += "\(sameCnt+1)\(curUnit)"
    } else {
        compressionStr += curUnit
    }

    // 남는거 이어 붙임
    if remainIndex != 0 {
        compressionStr += str[remainIndex..<str.count].joined()
    }
    return compressionStr.count
}


extension String {
    subscript(r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy:  r.upperBound)
        
        return String(self[start..<end])
    }
}


print(solution("aabbaccc"))


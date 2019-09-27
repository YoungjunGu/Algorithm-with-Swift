//
//  shortCoding.swift
//  Programmers_kakao[1차]_다트게임
//
//  Created by youngjun goo on 27/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


func splitScore(dartResult:String) -> [(Int, String)] {

    // "1D#2S*3S" 이면 *,#의 위치 index를 담고있는 배열을 반환
    let bonusIndex: [Int] = dartResult.enumerated().reduce([]) { acc, cur in
        if cur.element == "*" || cur.element == "#" {
            return acc + [cur.offset]
        }
        return acc
    }

    var value: String = ""
    var result: [(Int, String)] = []

    let dart = dartResult
    // enumerated() : for-in 과 동일하게
    dartResult.enumerated().forEach {
        if let singleNum = Int(String($0.element)) {
            value += String(singleNum)
        } else {
            if bonusIndex.contains($0.offset + 1) {
                // * or #
                let number = Int(value)!
                var optionA = String($0.element)

                let str = dart.index(dart.startIndex, offsetBy: $0.offset + 1)
                optionA += String(dart[str])

                result.append((number, optionA))
                value = ""
            } else if $0.element == "S" || $0.element == "D" || $0.element == "T" {
                let number = Int(value)!
                let optionA = String($0.element)
                result.append((number, optionA))
                value = ""
            }
        }
    }
    
    print(result)
    return result
}

func getScore(score: [(Int, String)]) -> Int {

    let data1 = score[0]
    let data2 = score[1]
    let data3 = score[2]

    var score1 = updateDST(data: data1)
    var score2 = updateDST(data: data2)
    var score3 = updateDST(data: data3)
    
    print(score1)
    print(score2)
    print(score3)

    if data1.1.contains("*") {
        score1 *= 2
    }

    if data2.1.contains("*") {
        score1 *= 2
        score2 *= 2
    }

    if data3.1.contains("*") {
        score2 *= 2
        score3 *= 2
    }

    return score1 + score2 + score3
}

func updateDST(data: (Int, String)) -> Int {
    if data.1.contains("S") {
        return data.1.contains("#") ? -1 * data.0 : data.0
    } else if data.1.contains("D") {
        return data.1.contains("#") ? -1 * data.0 * data.0 : data.0 * data.0
    } else {
        return data.1.contains("#") ? -1 * data.0 * data.0 * data.0 : data.0 * data.0 * data.0
    }
}

func solution2(_ dartResult:String) -> Int {
    return getScore(score: splitScore(dartResult: dartResult))
}


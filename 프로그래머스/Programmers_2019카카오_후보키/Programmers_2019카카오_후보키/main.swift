//
//  main.swift
//  Programmers_2019카카오_후보키
//
//  Created by youngjun goo on 2019/11/05.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    let column = relation[0].count
    var keyCount = 0
    var keyList: [String] = []
    for i in 0...column {
        var list: [String] = []
        var combi: [Int] = [Int](repeating: 0, count: i)
        combination(relation, i, combi: &combi, target: 0, n: column, index: 0, list: &list, &keyCount, &keyList)
    }
    return keyCount
}


// nCk
// sequence: n개로 이루어진 내가 조합할 배열
// k : n개중에 조합하여 만들어낼 k개를 지정
// combi: sequence에서 조합할 index 정보를 담고 있는 배열
// n : n개
// index : 현재 조합이 된 index 정보
// list : 최종적으로 조합이 된 정보를 담아 둘 list
func combination(_ relation: [[String]],
                 _ k: Int,
                 combi: inout [Int],
                 target: Int,
                 n: Int,
                 index: Int,
                 list: inout [String],
                 _ keyCount: inout Int,
                 _ keyList: inout [String])
{
    if k == 0 {
        print(combi)
        checkCandidateKey(relation: relation, combi: combi, keyCount: &keyCount, keyList: &keyList)
    }
    else if target == n {
        return
    }
    else {
        combi[index] = target
        combination(relation, k - 1, combi: &combi, target: target + 1, n: n, index: index + 1, list: &list, &keyCount, &keyList)
        combination(relation, k, combi: &combi, target: target + 1, n: n, index: index, list: &list, &keyCount, &keyList)
    }
}

func checkCandidateKey(relation: [[String]],
                       combi: [Int],
                       keyCount: inout Int,
                       keyList: inout [String])
{
    guard combi.count != 0 else { return }
    var key: [String] = []
    // 조합된 Int형 배열을 String으로 바꾸고 문자열로 반환
    let combiKey: String = combi.map { String($0) }.joined()

    // 최소성을 체크
    for str in keyList {
        if combiKey.contains(str) {
            return
        }
    }
    for row in 0..<relation.count {
        var candidateKey = ""
        for i in combi {
            candidateKey += relation[row][i]
        }
        if key.contains(candidateKey) {
            return
        }
        key.append(candidateKey)
    }
    keyCount += 1
    keyList.append(combiKey)
}



let relation = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]

let relation1 = [["1","2","3","4"], ["1","2","4","4"]]
print(solution(relation1))




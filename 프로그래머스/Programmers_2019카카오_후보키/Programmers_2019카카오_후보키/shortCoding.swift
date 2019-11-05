//
//  shortCoding.swift
//  Programmers_2019카카오_후보키
//
//  Created by youngjun goo on 2019/11/05.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution1(_ relation:[[String]]) -> Int {

    var candidateKey = [Int]()

    let row = relation.count
    let col = relation[0].count

    for i in 1 ..< (1 << col) {

        var tempSet = Set<String>()

        for j in 0..<row {
            var tmp = ""
            for k in 0..<col {
                if (i & (1 << k)) != 0 {
                    tmp += relation[j][k]
                }
            }
            tempSet.insert(tmp)
        }

        if tempSet.count == row {
            var contains = true

            for num in candidateKey {
                if (num & i) == num {
                    contains = false
                    break
                }
            }
            if contains {
                candidateKey.append(i)
            }
        }
    }

    return candidateKey.count
}

//
//  main.swift
//  Programmers_NQueen
//
//  Created by youngjun goo on 2019/12/07.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = 0
    let col: [Int] = [Int](repeating: 0, count: n)
    queens(n, col, 0, &answer)
    return answer
}

func queens(_ n: Int, _ col: [Int], _ cnt: Int, _ answer: inout Int) {
    var tempCol = col
    if cnt == n {
        answer += 1
    } else {
        for i in 0..<n {
            tempCol[cnt] = i
            if promising(cnt, tempCol) {
                queens(n, tempCol, cnt + 1, &answer)
            }
        }
    }
}

func promising(_ n: Int,_ col: [Int]) -> Bool {
    for i in 0..<n {
        if col[n] == col[i] { return false }                    // 열
        if abs(col[n] - col[i]) == abs(n - i) { return false }  // 대각선
    }
    return true
}


print(solution(4))

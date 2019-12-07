//
//  main.swift
//  Programmers_순위
//
//  Created by youngjun goo on 2019/12/07.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    let INF: Int = 987654321
    var answer = 0
    var matrix: [[Int]] = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
    
    for i in 0..<n {
        matrix[i][i] = 0
    }
    
    results.forEach{ result in
        matrix[result.first! - 1][result.last! - 1] = 1
    }
    
    for a in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = min(matrix[i][j], matrix[i][a] + matrix[a][j])
            }
        }
    }
    print(matrix)
    // 플로이드-와샬 알고리즘
    var flag = [Bool](repeating: true, count: n)
    for i in 0..<n {
        for j in 0..<n {
            if i == j { continue }
            if matrix[i][j] == INF {
                if matrix[j][i] == INF {
                    flag[i] = false
                    break
                }
            }
        }
    }
    
    flag.forEach{ if $0 { answer += 1 } }
    
    return answer
}


let n = 5
let results = [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]

print(solution(n, results))

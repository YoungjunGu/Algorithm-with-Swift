//
//  failCode.swift
//  Programmers_2017서머코딩_기지국설치
//
//  Created by youngjun goo on 2019/10/24.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


func solution2(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    var answer = 0
    
    var visited: [Int] = [Int](repeating: 0, count: n + 2)
    
    for pos in stations {
        let start = pos - w < 1 ? 1:pos - w
        let end = pos + w > n ? n:pos + w
        for i in start...end {
            visited[i] = -1
        }
    }
    
    visited[n + 1] = -1
    let range = (2 * w) + 1
    var cnt: Int = 0
    for i in 1...(n+1){
        if visited[i] == 0 {
            cnt += 1
        } else {
            if cnt != 0 {
                if cnt < range {
                    answer += 1
                } else {
                    answer += (cnt / range)
                    let remain = cnt % range
                    if remain > 0 {
                        answer += 1
                    }
                }
            }
            cnt = 0
        }
        visited[i] = -1
    }
    return answer
}


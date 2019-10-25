//
//  main.swift
//  Programmers_2017서머코딩_기지국설치
//
//  Created by youngjun goo on 2019/10/24.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    var ans = 0
    var idx = 0
    var location = 1
    
    
    while location <= n {
        if idx < stations.count && location >= stations[idx] - w {
            location = stations[idx] + w + 1
            idx += 1
        } else {
            location += 2*w+1
            ans += 1
        }
    }
    return ans
}


let station = [5, 9, 12]
print(solution(16, station, 1))

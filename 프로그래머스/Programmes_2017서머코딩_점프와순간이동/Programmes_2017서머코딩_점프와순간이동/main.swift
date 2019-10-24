//
//  main.swift
//  Programmes_2017서머코딩_점프와순간이동
//
//  Created by youngjun goo on 2019/10/24.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int {
    var ans:Int = 0
    var pos: Int = n
    
    while pos != 0 {
        
        if pos % 2 == 0 {
            pos /= 2
        } else {
            pos -= 1
            ans += 1
        }
    }

    return ans
}


print(solution(5000))


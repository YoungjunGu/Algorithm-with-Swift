//
//  main.swift
//  BaekJun_1463_dp_1로만들기
//
//  Created by youngjun goo on 25/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var read = readLine()
var num: Int = 0
var Dp = [Int](repeating: 0, count: 100001)


if let readString = read {
    num = Int(readString)!
} else {
    print("정수 하나를 입력해 주세요")
}

for i in 2..<num+1 {
    Dp[i] = Dp[i-1] + 1
    if i%2 == 0 {
        Dp[i] = min(Dp[i], Dp[i/2] + 1)
    }
    if i%3 == 0 {
        Dp[i] = min(Dp[i], Dp[i/3] + 1)
    }
    
}

print(Dp[num])



//
//  main.swift
//  BaekJoon_1149_DP_RGB거리
//
//  Created by youngjun goo on 26/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var cnt: Int = 0

func readInt() -> Int {
    let read = readLine()
    if let readString = read {
        return Int(readString)!
    } else {
        return 0
    }
}
//집의 개수
cnt = readInt()
//갑 집의 RGB 값을 저장 할 2차원 배열
var arr = [[Int]](repeating: Array(repeating: 0, count: 3), count: cnt+1)
var dp = [[Int]](repeating: Array(repeating: 0, count: 3), count: cnt+1)

for i in 1..<cnt+1{
    let read = readLine()
    
    if let read = read {
        let stringArray = read.components(separatedBy: " ")
        for j in 0..<3{
            arr[i][j] = Int(stringArray[j])!
        }
    }
}

for i in 1..<cnt+1 {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + arr[i][0]
    dp[i][1] = min(dp[i-1][2], dp[i-1][0]) + arr[i][1]
    dp[i][2] = min(dp[i-1][1], dp[i-1][0]) + arr[i][2]
}

print(min(dp[cnt][0], dp[cnt][1], dp[cnt][2]))


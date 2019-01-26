//
//  main.swift
//  BaekJun_2579
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

cnt = readInt()

var step = [Int](repeating: 0, count: cnt)
var dp = [Int](repeating: 0, count: cnt)

for i in 0..<cnt {
    step[i] = readInt()
}

//초기 값 설정 중요
dp[0] = step[0]
dp[1] = max(step[0] + step[1], step[1])
dp[2] = max(step[0] + step[2], step[1] + step[2])


//점화식을 이용해여 해결
for i in 3..<cnt {
    dp[i] = max(dp[i-2] + step[i], dp[i-3] + step[i-1] + step[i])
}

print(dp[cnt-1])







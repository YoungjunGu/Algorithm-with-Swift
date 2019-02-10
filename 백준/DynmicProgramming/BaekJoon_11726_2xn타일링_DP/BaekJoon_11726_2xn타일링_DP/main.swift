//
//  main.swift
//  BaekJoon_11726_2xn타일링_DP
//
//  Created by youngjun goo on 10/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


var dp = [Int](repeating: 0, count: 1010)

dp[0] = 1
dp[1] = 1

func tiling(n: Int) -> Int {
    if n <= 1 {
        return 1
    } else {
        for i in 2...n {
            dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
        }
        return dp[n]
    }
}

var read = readLine()
var n = Int(read!)!
print(tiling(n: n))



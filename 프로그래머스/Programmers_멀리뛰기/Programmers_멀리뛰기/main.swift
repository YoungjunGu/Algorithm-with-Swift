//
//  main.swift
//  Programmers_멀리뛰기
//
//  Created by youngjun goo on 26/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int64 {
    var dp = [1, 2]
    var i = 0
    while dp.count < n {
        dp.append((dp[i] + dp[i+1]) % 1234567)
        i += 1
    }
    
    return Int64(dp[n-1])
}



//func solution(_ n:Int) -> Int {
//    // 초기 1로만 갈때를 포함한 값
//    var cnt: Int = 1
//    var curNum: Int = 2
//
//    while curNum <= n {
//        let doubleCnt = curNum / 2
//        let oneCnt = n - curNum
//
//        if oneCnt != 0 {
//            cnt += getFactorial(doubleCnt + oneCnt) / ( getFactorial(doubleCnt) * getFactorial(oneCnt))
//        } else {
//            cnt += 1
//        }
//        curNum += 2
//    }
//
//    return cnt % 1234567
//}
//
//func getFactorial(_ num: Int) -> Int {
//    var mult: Int = 1
//    for i in 1...num {
//        mult *= i
//    }
//    return mult
//}

print(solution(4))

//
//  main.swift
//  BaekJoon_14501_삼성_퇴사
//
//  Created by youngjun goo on 22/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

print(" ")

var N: Int = 0
var ti = [Int](repeating: 0, count: 15)
var pi = [Int](repeating: 0, count: 15)
var dp = [Int](repeating: 0, count: 15)

let read = readLine()
N = Int(read!)!

func retire() {
    
    for i in 0..<N {
        let read = readLine()
        let inputString = read?.components(separatedBy: " ")
        ti[i] = Int(inputString![0])!
        pi[i] = Int(inputString![1])!
    }
    
    //
    var nextDay: Int = 0
    for i in 0..<N {
        //i == current day selection
        nextDay = i
        if ti[nextDay] + i < N {
            while ti[nextDay] + nextDay <= N {
                print("i : \(i), nextDay: \(nextDay)")
                dp[i] += pi[nextDay]
                nextDay += ti[nextDay]
                if nextDay >= N {
                    break
                }
            }
        }
    }
    
    let maxProfit = dp.max()
    print(dp)
    print(maxProfit!)
}

retire()

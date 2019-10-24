//
//  main.swift
//  Programmers_2017서머코딩_소수만들기
//
//  Created by youngjun goo on 2019/10/24.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer: Int = 0
    var combi: [Int] = [Int](repeating: 0, count: 3)
    combination(nums, &combi, 0, nums.count, 0, 3, &answer)
    
    return answer
}

func checkPrime(_ num: Int) -> Bool {
    var index: Int = 0
    for i in 2...num {
        if num % i == 0 {
            index = i
            break
        }
    }
    if index == num {
        return true
    }
    return false
}

func combination(_ nums: [Int], _ combi: inout [Int], _ target: Int,
                 _ n: Int, _ index: Int, _ k: Int, _ answer: inout Int)
{
    if k == 0 {
        var checkNum: Int = 0
        for i in combi {
            checkNum += nums[i]
        }
        // 소수이면 1 더함
        if checkPrime(checkNum) {
            answer += 1
        }
    }
    else if target == n {
        return
    }
    else {
        combi[index] = target
        combination(nums, &combi, target + 1, n, index + 1, k - 1, &answer)
        combination(nums, &combi, target + 1, n, index, k, &answer)
    }
}

let nums = [1,2,3,4]
print(solution(nums))


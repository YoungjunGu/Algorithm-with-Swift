//
//  main.swift
//  N으로표현
//
//  Created by youngjun goo on 18/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var answer = -1

func solution(_ N:Int, _ number:Int) -> Int {
    
    dfs(N, number, 0, 0)
    
    return answer
}

func dfs(_ N: Int, _ number: Int, _ curCnt: Int, _ curNum: Int) {

    if curCnt > 8 {
        answer = -1
        return
    }
    // 연산한 값이 같으면 최소값 return
    if curNum == number {
        if answer == -1 || answer > curCnt {
            answer = curCnt
        }
        return
    }
    
    var tempNum = N
    
    // 사칙 연산 + - * / : 4가지
   
    for i in 0..<(8-curCnt) {
        dfs(N, number, curCnt + i + 1, curNum + tempNum)
        dfs(N, number, curCnt + i + 1, curNum - tempNum)
        dfs(N, number, curCnt + i + 1, curNum / tempNum)
        dfs(N, number, curCnt + i + 1, curNum * tempNum)
        
        tempNum = attachNum(tempNum, N)
        
    }
    
    return
}


// 5 -> 55 -> 555 -> 5555... 로 숫자를 이어 붙이는 함수
func attachNum(_ num: Int, _ N: Int) -> Int {
    
    return ((num * 10) + N)
}


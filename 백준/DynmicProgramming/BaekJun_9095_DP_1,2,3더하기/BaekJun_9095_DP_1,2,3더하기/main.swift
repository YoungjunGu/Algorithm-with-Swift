//
//  main.swift
//  BaekJun_9095_DP_1,2,3더하기
//
//  Created by youngjun goo on 25/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var cnt: Int = 0
var num: Int = 0
var arr = [Int](repeating: 0, count: 12)

func scanf() -> Int {
    
    guard let read = readLine() else {
        return 0
    }
    return Int(read)!
}

//초기 값 설정 피보나치와 비슷 한 문제 -> 점화식을 찾아 해결하면 된다.
arr[0] = 0
arr[1] = 1
arr[2] = 2
arr[3] = 4

func setArray() {
    for i in 4..<arr.count {
        arr[i] = arr[i - 1] + arr[i - 2] + arr[i - 3]
    }
}

setArray()

cnt = scanf()
var list = [Int](repeating: 0, count: cnt)

for i in 0..<cnt {
    num = scanf()
    list[i] = arr[num]
}

for i in 0..<cnt {
    print(list[i])
}



//
//  main.swift
//  BaekJoon_1325_효율적인해킹
//
//  Created by youngjun goo on 31/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var ans = [Int](repeating: 0, count: 10001)
var graph = [[Int]](repeating: Array(repeating: 0, count: 10001), count: 10001)
var visited = [Int](repeating: 0, count: 10001)

var N: Int = 0
var M: Int = 0
var cnt: Int = 0

var read = readLine()
var inputArray = read?.components(separatedBy: " ")
N = Int(inputArray![0])!
M = Int(inputArray![1])!

func dfs(com: Int) {
    if visited[com] != 0 {
        return
    }
    
    visited[com] = 1
    cnt += 1
    
    for i in 0..<graph[com].count {
        dfs(com: graph[com][i])
    }
}


func hacking() {
    for _ in 0..<M {
        let read = readLine()
        let readString = read?.components(separatedBy: " ")
        let to = Int(readString![0])!
        let from = Int(readString![1])!
        graph[to].append(from)
    }
    
    for i in 1...N {
        cnt = 0
        dfs(com: i)
        ans[i] = cnt
    }
    
    var max: Int = -1
    for i in 1...N {
        if ans[i] > max {
            max = ans[i]
        }
    }
    
    for i in 1...N {
        if max == ans[i] {
                 print(i)
        }
    }
}

hacking()


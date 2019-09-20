//
//  main.swift
//  섬연결하기
//
//  Created by youngjun goo on 20/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var dsjSet = [[Int]]()
    
    for dsj in costs {
        dsjSet.append(dsj)
    }
    
    dsjSet.sort { (first, second) -> Bool in first[2] < second[2] }
    
    print(dsjSet)
    
    return findMinimunDistance(n: n, costs: dsjSet)
}

func collapsingFind(vertex n: Int, forest: inout [Int]) -> Int {
    var r = n
    var i = n
    while forest[r] >= 0 {
        r = forest[r]
    }
    
    while i != r {
        let s = forest[i]
        forest[i] = r
        i = s
    }
    return r
}

func weightedUnion(i: Int, j: Int, forest: inout [Int]) {
    let temp = forest[i] + forest[j]
    
    if forest[i] > forest[j] {
        forest[i] = j
        forest[j] = temp
    } else {
        forest[j] = i
        forest[i] = temp
    }
}

func findMinimunDistance(n: Int, costs: [[Int]]) -> Int {
    var answer = 0
    var parent = [Int]()
    
    for _ in 0...n {
        parent.append(-1)
    }
    
    // disjoint set 정렬

    for dsj in costs {
        let v1 = collapsingFind(vertex: dsj[0], forest: &parent)
        let v2 = collapsingFind(vertex: dsj[1], forest: &parent)
        
        // 부모가 같지 않을 때
    
        if v1 != v2 {
            weightedUnion(i: v1, j: v2, forest: &parent)
            answer = answer + dsj[2]
        }
    }
    
    return answer
    
}


let costs = [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]
let n = 4

print(solution(4, costs))




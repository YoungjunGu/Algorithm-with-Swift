//
//  main.swift
//  Programmers_2017서머코딩_배달
//
//  Created by youngjun goo on 2019/10/25.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    let MAX = 987654321
    var matrix: [[Int]] = []
    
    var distance: [Int] = [Int](repeating: MAX, count: N + 1)
    var visited: [Bool] = [Bool](repeating: true, count: N + 1)
    for _ in 0...N {
        matrix.append([Int](repeating: MAX, count: N + 1))
    }
    
    // disjoint Set 값 distance 에 추가
    road.forEach { dsj in
        matrix[dsj[0]][dsj[1]] = min(matrix[dsj[0]][dsj[1]], dsj[2])
        matrix[dsj[1]][dsj[0]] = min(matrix[dsj[1]][dsj[0]], dsj[2])
    }
    
    shortestPath(&distance, matrix, &visited, N)
    
    distance.forEach{ weight in
        if weight <= k {
            answer += 1
        }
    }
    
    return answer
}

func shortestPath(_ distance: inout [Int],_ matrix: [[Int]], _ visited: inout [Bool], _ N: Int) {
    var nextVertex: Int
    // 1 부터 시작
    distance[1] = 0
    
    for i in 1...N {
        distance[i] = matrix[1][i]
    }
    
    distance[1] = 0
    visited[1] = false
    for _ in 1...N-2 {
        nextVertex = selectPath(distance, N, visited)
        visited[nextVertex] = false
        for j in 1...N {
            if visited[j] {
                if distance[nextVertex] + matrix[nextVertex][j] < distance[j] {
                    distance[j] = distance[nextVertex] + matrix[nextVertex][j]
                }
            }
        }
    }
}

func selectPath(_ distance: [Int], _ N: Int, _ visited: [Bool]) -> Int {
    var minWeight = 987654321
    var minPosition = -1
    
    for i in 1...N {
        if minWeight > distance[i] && visited[i] {
            minWeight = distance[i]
            minPosition = i
        }
    }
    return minPosition
}


let road = [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]]
let N = 5
let K = 3

print(solution(N, road, K))




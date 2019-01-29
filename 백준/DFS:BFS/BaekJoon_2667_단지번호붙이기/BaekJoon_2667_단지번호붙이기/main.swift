//
//  main.swift
//  BaekJoon_2667_단지번호붙이기
//
//  Created by youngjun goo on 28/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


var n: Int = 0
var cnt: Int = 0
var read = readLine()

n = Int(read!)!

var map = [[Int]](repeating: Array(repeating: 0, count: 26), count: 26)
var visited = [[Int]](repeating: Array(repeating: 0, count: 26), count: 26)
var dan = [Int](repeating: 0, count: n * n)

var dirX = [0, 0, -1, 1]
var dirY = [-1, 1, 0, 0]

for i in 1..<n + 1 {
    let read = readLine()
    let stringArray = read?.components(separatedBy: " ")
    for j in 0..<n {
        map[i][j + 1] = Int(stringArray![j])!
    }
}

func dfs(x: Int, y: Int) {
    dan[cnt] += 1
    visited[x][y] = 1
    for i in 0...3 {
        let nextX = x + dirX[i]
        let nextY = y + dirY[i]
        if map[nextX][nextY] == 1 && visited[nextX][nextY] == 0 {
            dfs(x: nextX, y: nextY)
        }
    }
}


for i in 1..<n + 1 {
    for j in 1..<n + 1{
        //아직 방문 하지 않았고 아파트가 있으면 dfs 수행
        if map[i][j] == 1 && visited[i][j] == 0 {
            dfs(x: i, y: j)
            cnt += 1
        }
    }
}

dan.sort()
print(cnt)
for i in 0..<cnt {
    print(dan[i])
}

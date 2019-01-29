//
//  main.swift
//  BaekJoon_1012_유기농배추
//
//  Created by youngjun goo on 29/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var testCaseNum: Int = 0
var row: Int = 0
var col: Int = 0
var cabCount: Int = 0
var larva: Int = 0

var solution = [Int]()
var map = [[Int]](repeating: Array(repeating: 0, count: 50), count: 50)
var visited = [[Int]](repeating: Array(repeating: 0, count: 50), count: 50)

var dirX = [0, 0, -1, 1]
var dirY = [-1, 1, 0, 0]

func dfs(x: Int, y: Int) {
    
    visited[x][y] = -1
    for i in 0...3 {
        let nextX = x + dirX[i]
        let nextY = y + dirY[i]
        if nextX >= 0 && nextY >= 0 {
            if map[nextX][nextY] == 1 && visited[nextX][nextY] == 0  {
                dfs(x: nextX, y: nextY)
            }
        }
    }
}


func findLarvaCount(cnt: Int) {
    for _ in 0..<cnt {
        larva = 0
        let read = readLine()
        var stringArray = read?.components(separatedBy: " ")
        row = Int(stringArray![0])!
        col = Int(stringArray![1])!
        cabCount = Int(stringArray![2])!
        
        
        
        for _ in 0..<cabCount {
            let read = readLine()
            var stringArray = read?.components(separatedBy: " ")
            let i = Int(stringArray![0])!
            let j = Int(stringArray![1])!
            map[i + 1][j + 1] = 1
        }
        
        for i in 1..<row + 1 {
            for j in 1..<col + 1 {
                if map[i][j] == 1 && visited[i][j] == 0 {
                    larva += 1
                    dfs(x: i, y: j)
                }
            }
        }
        solution.append(larva)
        
        for i in 0...49 {
            for j in 0...49 {
                map[i][j] = 0
                visited[i][j] = 0
            }
        }
    }
}

let read = readLine()
testCaseNum = Int(read!)!
findLarvaCount(cnt: testCaseNum)

for i in 0..<testCaseNum {
    print(solution[i])
}




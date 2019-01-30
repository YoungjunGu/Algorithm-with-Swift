//
//  main.swift
//  BaekJoon_7576_토마토
//
//  Created by youngjun goo on 30/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

struct Index {
    let x: Int
    let y: Int
    init(i: Int, j: Int) {
        x = i
        y = j
    }
}
var dirX = [-1, 1, 0, 0]
var dirY = [0, 0, -1, 1]

var row: Int = 0
var col: Int = 0
var queue = Queue<Index>()
var farm = [[Int]](repeating: Array(repeating: 0, count: 1000), count: 1000)
var visited = [[Int]](repeating: Array(repeating: 0, count: 1000), count: 1000)

var checkPossible: Int = 0

var read = readLine()
var stringArry = read?.components(separatedBy: " ")
col = Int(stringArry![0])!
row = Int(stringArry![1])!

for i in 0..<row {
    let read = readLine()
    let stringLine = read?.components(separatedBy: " ")
    for j in 0..<col {
        farm[i + 1][j + 1] = Int(stringLine![j])!
    }
}

func tomato() {
    for i in 1..<row + 1 {
        for j in 1..<col + 1 {
            if farm[i][j] == 1 {
                let position = Index(i: i, j: j)
                queue.enqueue(element: position)
            }
        }
    }
    
    while queue.isEmpty() != false {
        let tomatoPosition = queue.dequeue()
        for i in 0...3 {
            let nextX = (tomatoPosition?.x)! + dirX[i]
            let nextY = (tomatoPosition?.y)! + dirY[i]
            
            if nextX <= 0 || nextY <= 0 || nextX > row || nextY > col {
                continue
            }
            if farm[nextX][nextY] != 0 {
                continue
            }
            farm[nextX][nextY] = farm[(tomatoPosition?.x)!][(tomatoPosition?.y)!] + 1
            queue.enqueue(element: tomatoPosition!)
        }
    }
    var maxDate: Int = 0
    for i in 1..<row + 1 {
        for j in 1..<col + 1 {
            if farm[i][j] == 0 {
                checkPossible = -1
            }
        }
    }
    if checkPossible == 0 {
        for i in 1..<row + 1 {
            for j in 1..<col + 1 {
                if maxDate < farm[i][j] {
                    maxDate = farm[i][j]
                }
            }
        }
        print(maxDate)
    } else {
        print(-1)
    }
}


tomato()






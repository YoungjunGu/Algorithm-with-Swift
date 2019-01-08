//
//  main.swift
//  BeakHoon_14503_RoboticVacuum
//
//  Created by youngjun goo on 07/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


var read = readLine()
var M: Int = 0
var N: Int = 0
var r: Int = 0
var c: Int = 0
var d: Int = 0
var map : [[Int]] = Array(repeating: Array(repeating: 0,count:50 ), count: 50)
//각 방향으로 이동시에 필요한 정수값 갖는 배열
var dx: [Int] = [-1,0,1,0]
var dy: [Int] = [0,1,0,-1]
//각 방향에서의 후진에 필요한 정수값 배열
var backX: [Int] = [1, 0, -1, 0]
var backY: [Int] = [0, -1, 0, 1]
//청소기가 청소한 구역의 개수
var clean: Int = 0


if let read = read {
    let stringArray = read.components(separatedBy: " ")
    M = Int(stringArray[0])!
    N = Int(stringArray[1])!
}

read = readLine()

if let read = read {
    let stringArray = read.components(separatedBy: " ")
    r = Int(stringArray[0])!
    c = Int(stringArray[1])!
    d = Int(stringArray[2])!
}

for row in 0..<M {
    read = readLine()
    
    if let read = read {
        let stringArray = read.components(separatedBy: " ")
        for col in 0..<N {
            map[row][col] = Int(stringArray[col])!
        }
    }
}


public func DFS(x: Int, y: Int, dir: Int) {
    var direction: Int = dir
    //벽에 부딛혔을때 종료
    if map[x][y] == 1 {
        return
    }
    
    if map[x][y] == 0 {
        map[x][y] = 2;
        clean += 1
    }
    //방향은 죄측으로 한번만 이동하기 때문에 북0 -> 서3, 서3 -> 남2, 남2 -> 동1, 동1 -> 북0
    for _ in 0..<4 {
        
        var nextDir: Int!
        var nextX: Int!
        var nextY: Int!
        
        if dir - 1 < 0 {
            nextDir = 3
        } else {
            nextDir = dir - 1
        }
        nextX = x + dx[nextDir]
        nextY = y + dy[nextDir]
        
        //청소 해야 하는 곳이면 청소
        if map[nextX][nextY] == 0 {
            DFS(x: nextX, y: nextY, dir: nextDir)
            return
        } else {
            //청소한 곳이나 벽이면 방향만 전환 -> 다음 방향값 저장
            direction = nextDir
        }
    }
    let nextX: Int! = x + backX[direction]
    let nextY: Int! = y + backY[direction]
    
    DFS(x: nextX, y: nextY, dir: direction)
}


DFS(x: r, y: c, dir: d)

print(clean)
print()



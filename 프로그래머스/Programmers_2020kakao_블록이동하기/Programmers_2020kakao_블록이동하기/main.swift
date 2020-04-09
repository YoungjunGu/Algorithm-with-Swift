//
//  main.swift
//  Programmers_2020kakao_블록이동하기
//
//  Created by youngjun goo on 2020/04/09.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let N: Int = board.count
    let newBoard = makeBoardWall(board)
    let goal = Index(N, N)
    
    return shortestTimeUsingBFS(newBoard, goal)
}


func shortestTimeUsingBFS(_ board: [[Int]], _ goal: Index) -> Int {
    var queue: [Position] = []
    var visited: [Position] = []
    
    let startPosition = Position(first: Index(1, 1), second: Index(1, 2), dir: 0, dist: 0)
    queue.append(startPosition)
    visited.append(startPosition)
    
    while queue.count != 0 {
        guard let head = queue.first else { return 0 }
        queue.removeFirst()
        let dist = head.dist + 1
        for move in moves(board, head) {
            if move.first == goal || move.second == goal { return dist}
            if !visited.contains(move) {
                var nextPosition = move
                nextPosition.dist = dist
                queue.append(nextPosition)
                visited.append(nextPosition)
            }
        }
    }
    return 0
}

func moves(_ board: [[Int]], _ position: Position) -> [Position] {
    var positions: [Position] = []
    let dirX = [-1, 0, 1, 0]
    let dirY = [0, 1, 0, -1]
    
    for i in 0..<4 {
        var nextPosition = position
        nextPosition.movePosition(x: dirX[i], y: dirY[i])
        if isMovable(board, nextPosition) {
            positions.append(nextPosition)
        }
    }
    
    positions += rotate(board, position)
    return positions
}

func rotate(_ board: [[Int]], _ position: Position) -> [Position] {
    let firstIndex = position.first
    let secondIndex = position.second
    var positions: [Position] = []
    let rotates = [1, -1]
    // 가로회전
    if position.dir == 0 {
        for rotate in rotates {
            let firstPosition = Position(first: Index(firstIndex.x + rotate, firstIndex.y) , second: Index(firstIndex.x, firstIndex.y), dir: 1, dist: position.dist)
            let secondPosition = Position(first: Index(secondIndex.x + rotate, secondIndex.y) , second: Index(secondIndex.x, secondIndex.y), dir: 1, dist: position.dist)
            if isMovable(board, firstPosition) { positions.append(firstPosition) }
            if isMovable(board, secondPosition) { positions.append(secondPosition) }
        }
    } else {
        for rotate in rotates {
            let firstPosition = Position(first: Index(firstIndex.x, firstIndex.y) , second: Index(firstIndex.x, firstIndex.y + rotate), dir: 0, dist: position.dist)
            let secondPosition = Position(first: Index(secondIndex.x, secondIndex.y) , second: Index(secondIndex.x, secondIndex.y + rotate), dir: 0, dist: position.dist)
            if isMovable(board, firstPosition) { positions.append(firstPosition) }
            if isMovable(board, secondPosition) { positions.append(secondPosition) }
        }
    }
    return positions
}

func isMovable(_ board: [[Int]], _ position: Position) -> Bool {
    let first: Index = position.first
    let second: Index = position.second
    if first.x >= 0 && first.y >= 0 && first.x <= board.count && first.y <= board.count && second.x >= 0 && second.y >= 0 && second.x <= board.count && second.y <= board.count {
        if board[first.x][first.y] == 0 && board[second.x][second.y] == 0 {
            return true
        }
    }
    return false
}

func makeBoardWall(_ board: [[Int]]) -> [[Int]] {
    var newBoard = [[Int]](repeating: [Int](repeating: 1, count: board.count + 2), count: board.count + 2)
    
    for i in 0..<board.count {
        for j in 0..<board.count {
            newBoard[i + 1][j + 1] = board[i][j]
        }
    }
    return newBoard
}

struct Position: Equatable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        return (lhs.first == rhs.first) && (lhs.second == rhs.second)
    }
    
    var first: Index
    var second: Index
    var dir: Int // 0이면 가로 1이면 세로
    var dist: Int
    
    mutating func movePosition(x: Int, y: Int) {
        self.first.move(x, y)
        self.second.move(x, y)
    }
}

struct Index: Equatable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    mutating func move(_ x: Int, _ y: Int) {
        self.x += x
        self.y += y
    }
}




let board = [[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]
print(solution(board))

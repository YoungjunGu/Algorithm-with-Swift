//
//  main.swift
//  Programmers_2020카카오_자물쇠와열쇠
//
//  Created by youngjun goo on 2019/11/06.
//  Copyright © 2019 youngjun goo. All rights reserved.
//
import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var keyMap = key
    
    for _ in 0..<keyMap.count {
        if check(keyMap, lock) {
            return true
        }
        
        keyMap = rotate(keyMap)
    }
    
    return false
}

// 회전한 배열을 반환
func rotate(_ key:[[Int]]) -> [[Int]] {
    var temp = [[Int]](repeating: [Int](repeating: 0, count: key.count), count: key.count)
    
    for i in 0..<key.count {
        for j in 0..<key.count {
            temp[i][j] = key[key.count - j - 1][i]
        }
    }
    
    return temp
}
// 동, 서, 남, 북 으로 한칸씩 밀어낸 배열을 반환
func move(_ key: [[Int]], _ N: Int, _ row: Int, col: Int) -> [[Int]] {
    var temp = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for i in 0..<key.count {
        for j in 0..<key.count where i + row >= 0 && i + row < N && j + col >= 0 && j + col < N {
            temp[i + row][j + col] = key[i][j]
        }
    }
    return temp
}

func isUnlock(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    for i in 0..<lock.count {
        for j in 0..<lock.count where key[i][j]^lock[i][j] == 0 {
            return false
        }
    }
    return true
}

func check(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    
    for i in 1-key.count..<lock.count {
        for j in 1-key.count..<lock.count {
            let moveMap = move(key, lock.count, i, col: j)
            if isUnlock(moveMap, lock) { return true }
        }
    }
    
    return false
}



let key = [[0, 0, 0], [1, 0, 0], [0, 1, 1]]
let lock = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]


print(solution(key, lock))

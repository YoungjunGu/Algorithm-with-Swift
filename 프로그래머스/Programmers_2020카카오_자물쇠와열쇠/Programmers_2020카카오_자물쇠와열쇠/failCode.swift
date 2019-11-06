//
//  failCode.swift
//  Programmers_2020카카오_자물쇠와열쇠
//
//  Created by youngjun goo on 2019/11/06.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

struct Pos: Equatable {
    var x: Int
    var y: Int
    init(_ x: Int, _ y : Int) {
        self.x = x
        self.y = y
    }
}

func solution2(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var answer = false
    let N = key.count
    var keyPos = [Pos]()
    var lockPos = [Pos]()
    // key, lock의 각각 돌기와 홈 위치 저장
    for x in 0..<N {
        for y in 0..<N {
            if lock[x][y] == 0 {
                lockPos.append(Pos(x, y))
            }
        }
    }
    keyPos = keySpinPosition(key, N)
    solveTheLock(key, keyPos, lockPos, N, &answer)
    
    return answer
}
// 현재 돌기된 부부
func keySpinPosition(_ key: [[Int]], _ N: Int) -> [Pos] {
    var keyPos = [Pos]()
    for x in 0..<N {
        for y in 0..<N {
            if key[x][y] == 1 {
                keyPos.append(Pos(x, y))
            }
        }
    }
    return keyPos
}

func solveTheLock(_ key: [[Int]],
                  _ keyPos: [Pos],
                  _ lockPos: [Pos],
                  _ N: Int,
                  _ answer: inout Bool) {
    
    if keyPos.count < lockPos.count { return }
    
    if checkUnLock(keyPos, lockPos) {
        answer = true
        return
    }
    // 돌렸을때
    var rotateKey = key
    for _ in 0..<3 {
        rotateKey = rotateArray(rotateKey, N)
        let ratateKeyPos = keySpinPosition(rotateKey, N)
        if checkUnLock(ratateKeyPos, lockPos) {
            answer = true
            return
        }
    }

    for i in 0..<4 {
        let moveKey = moveTheKey(key, N, i)
        let moveKeyPos = keySpinPosition(moveKey, N)
        solveTheLock(moveKey, moveKeyPos, lockPos, N, &answer)
    }
}

func moveTheKey(_ key: [[Int]],
                _ N: Int,
                _ dir: Int) -> [[Int]] {
    var moveKey = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if dir == 0 {        // 위
                if i - 1 >= 0 {
                    moveKey[i-1][j] = key[i][j]
                }
            } else if dir == 1 {  // 오른쪽
                if j + 1 < N {
                    moveKey[i][j+1] = key[i][j]
                }
            } else if dir == 2 {  // 아래쪽
                if i + 1 < N {
                    moveKey[i+1][j] = key[i][j]
                }
            } else {              // 왼쪽
                if j - 1 >= N {
                    moveKey[i][j-1] = key[i][j]
                }
            }
        }
    }
    return moveKey
}


// unlock이 가능한지 확인
func checkUnLock(_ keyPos: [Pos],
                 _ lockPos: [Pos]) -> Bool {
    var slotCnt: Int = 0
    for pos in keyPos {
        if lockPos.contains(pos) {
            slotCnt += 1
        }
    }
    
    if slotCnt == lockPos.count {
        return true
    } else {
        return false
    }
}
// 회전한 배열 반환
func rotateArray(_ key: [[Int]],
                 _ N: Int) -> [[Int]] {
    var rotationArr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            rotationArr[j][N-1-i] = key[i][j]
        }
    }
    return rotationArr
}

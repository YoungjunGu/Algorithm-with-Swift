//
//  main.swift
//  Programmers_카카오1차_프렌즈4블록
//
//  Created by youngjun goo on 2019/11/01.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    var boardMap = [[String]](repeating: [String](repeating: "0", count: n), count: m)
    
    
    for i in 0..<m {
        let wordLine = board[i].map{ String($0)}
        for j in 0..<n {
            boardMap[i][j] = wordLine[j]
            //boardMap[i][j] wordLine[wordLine.index(wordLine.startIndex, offsetBy: j)]
        }
    }
    
    
    var isExist = true
    while isExist == true {
        var visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        isExist = false
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                if boardMap[i][j] == "0" {
                    continue
                }
                if checkFourBlock(boardMap, i: i, j: j) {
                    visited[i][j] = 1
                    visited[i][j+1] = 1
                    visited[i+1][j] = 1
                    visited[i+1][j+1] = 1
                    isExist = true
                }
            }
        }
        
        if isExist {
            for i in 0..<m {
                for j in 0..<n {
                    if visited[i][j] == 1 {
                        answer += 1
                        if i != 0 {
                            for row in (0...i-1).reversed() {
                                boardMap[row+1][j] = boardMap[row][j]
                            }
                        }
                        boardMap[0][j] = "0"
                    }
                }
            }
        }
    }
    
    return answer
}

func checkFourBlock(_ boardMap: [[String]], i: Int, j: Int) -> Bool {
    // 오른쪽 아래 대각선이 같은지체크
    if (boardMap[i][j] == boardMap[i][j+1]) && (boardMap[i][j] == boardMap[i+1][j]) && (boardMap[i][j] == boardMap[i+1][j+1]) {
        return true
    } else {
        return false
    }
    
}


let board = ["CCBDE", "AAADE", "AAABF", "CCBBF"]

print(solution(4, 5, board))

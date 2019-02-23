//
//  main.swift
//  BaekJoon_14502_삼성_연구소
//
//  Created by youngjun goo on 23/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


struct Index {
    let x: Int
    let y: Int
    init(i: Int,j: Int) {
        x = i
        y = j
    }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var N: Int = 0
var M: Int = 0
var queue = Queue<Index>()
var lab = [[Int]](repeating: Array(repeating: 0, count: 8), count: 8)
var tempLab = [[Int]](repeating: Array(repeating: 0, count: 8), count: 8)
var safeZone = 0

let read = readLine()
let lineArray = read?.components(separatedBy: " ")
N = Int(lineArray![0])!
M = Int(lineArray![1])!


func defenceVi() {
 
    //연구실 지도 입력
    for i in 0..<N {
        let read = readLine()
        let lineArray = read?.components(separatedBy: " ")
        for j in 0..<M {
            lab[i][j] = Int(lineArray![j])!
        }
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if lab[i][j] == 0 {
                tempLab = lab
                tempLab[i][j] = 1
                wallSetting(cnt: 1)
                tempLab[i][j] = 0
            }
        }
    }
    
    print(safeZone)
}

//재귀를 이용해 벽을 설치 한 후 DFS를 통한 안전구역 구하기
//원리: 전체 0인 구역중 모든 경우의 수를 위해 재귀함수를 통해 벽 3개를 추출 3개를 쌓는 동시에 infectVirus 함수 수행
func wallSetting(cnt: Int) {
    //3개의 벽을 정했으면 바이러스를 퍼뜨려 안전구역을 구한다.
    if cnt == 3 {
        infectVirus()
        return
    }
    //경우의 수를 위해 재귀 수행
    for i in 0..<N {
        for j in 0..<M {
            //빈공간이면 해당 구역을 벽을 새우고
            if tempLab[i][j] == 0 {
                tempLab[i][j] = 1
                wallSetting(cnt: cnt + 1)
                //모든 경우의 수를 위해 해당 구역은 다시 0 으로 만든 다음 재귀 수행
                tempLab[i][j] = 0
            }
        }
    }
}

//BFS 이용해 바이러스를 퍼뜨린 후 안전 영역을 구함
func infectVirus() {
    var spreadLab = tempLab
    
    //맵을 돌면서 바이러스 인 부분을 큐에 넣음
    for i in 0..<N {
        for j in 0..<M {
            if spreadLab[i][j] == 2 {
                let index = Index(i: i, j: j)
                queue.enqueue(element: index)
            }
        }
    }
    while !queue.isEmpty() {
        let position = queue.dequeue()
        for i in 0..<4 {
            let nextX = position!.x + dx[i]
            let nextY = position!.y + dy[i]
            if 0 <= nextX && nextX < N && 0 <= nextY && nextY < M {
                //빈공간이라면 2(바이러스) 로 해당 구역을 변경
                if spreadLab[nextX][nextY] == 0 {
                    spreadLab[nextX][nextY] = 2
                    queue.enqueue(element: Index.init(i: nextX, j: nextY))
                }
            }
        }
    }
    
    var cnt = 0
    for i in 0..<N {
        for j in 0..<M {
            if spreadLab[i][j] == 0 {
                cnt += 1
            }
        }
    }
    safeZone = max(safeZone, cnt)
}


defenceVi()

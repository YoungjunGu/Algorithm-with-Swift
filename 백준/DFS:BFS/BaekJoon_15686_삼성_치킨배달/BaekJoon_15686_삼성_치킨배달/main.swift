//
//  main.swift
//  BaekJoon_15686_삼성_치킨배달
//
//  Created by youngjun goo on 11/02/2019.
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
var max: Int = 99999999
var N: Int = 0
var M: Int = 0
var house = [Index]()
var store = [Index]()
var visited = [Bool](repeating: false, count: 14)
var matrix = [[Int]](repeating: Array(repeating: 0, count: 14), count: 101)

var minDistance: Int = 99999999


func dfs(curStore: Int, totalStore: Int) {
    
    if curStore > store.count {
        return
    }
    //남기고자 하는 치킨집 개수와 같으면 치킨 거리 계산 수행
    if totalStore == M {
        var cmp: Int = 0
        
        for i in 0..<house.count {
            
            var totalDistance = max
            for j in 0..<store.count {
                //방문을 하지 않았다면 방문을 해서 거리값을 구해야 한다.
                if visited[j] == true {
                    let housePosition = house[i]
                    let storePosition = store[j]
                    //둘 사이의 거리값 측정
                    let distance = abs((housePosition.x) - (storePosition.x)) + abs((housePosition.y) - (storePosition.y))
                    totalDistance = min(totalDistance, distance)
                }
            }
            cmp = cmp + totalDistance
        }
        minDistance = min(cmp, minDistance)
        
        return
    }
    //만약 현재의 치킨집을 사용 할 경우 방문함을 바꾸고 DFS 최종 카운트 수를 변경
    visited[curStore] = true
    dfs(curStore: curStore+1, totalStore: totalStore+1)
    //방문 하지 않는 다면 변경 없이
    visited[curStore] = false
    dfs(curStore: curStore+1, totalStore: totalStore)
    
}

func solveChickenStreet() {
    let read = readLine()
    var sizeString = read?.components(separatedBy: " ")
    N = Int(sizeString![0])!
    M = Int(sizeString![1])!
    
    for i in 0..<N {
        let read = readLine()
        var lineString = read?.components(separatedBy: " ")
        for j in 0..<N {
            
            let position = Index(i: i, j: j)
            //집이면
            if lineString![j] == "1" {
               house.append(position)
            } else if lineString![j] == "2"{
                store.append(position)
            }
        }
    }

    dfs(curStore: 0, totalStore: 0)
    
    print(minDistance)
}


solveChickenStreet()




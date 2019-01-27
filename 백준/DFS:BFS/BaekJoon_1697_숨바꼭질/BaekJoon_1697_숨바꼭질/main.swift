//
//  main.swift
//  BaekJoon_1697_숨바꼭질
//
//  Created by youngjun goo on 27/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var queue = Queue<Int>()
var visit = [Bool](repeating: true, count: 100001)
var currentX: Int = 0       //현재 수빈이의 위치
var targetY: Int = 0        //수빈이가 가야할 동생의 위치


var read = readLine()
if let readString = read {
    var stringArray = readString.components(separatedBy: " ")
    currentX = Int(stringArray[0])!
    targetY = Int(stringArray[1])!
} else {
    print("readLine error")
}

func bfs() -> Int {
    var cnt: Int = 0
    var delete: Int = 0
    queue.enqueue(element: currentX)    //현재 위치 큐에 삽입
    
    while(queue.isEmpty() == false ) {
        let size = queue.count
        
        for _ in 0..<size {
            currentX = queue.peek()! //큐의 맨처음 front 값을 반환
            delete = queue.dequeue()!
            //
            if currentX == targetY {
                return cnt
            }
            if currentX > 0 && visit[currentX - 1] == true {
                queue.enqueue(element: currentX - 1)
                visit[currentX - 1] = false
            }
            if currentX < 100000 && visit[currentX + 1] == true {
                queue.enqueue(element: currentX + 1)
                visit[currentX + 1] = false
            }
            if currentX * 2 <= 100000 && visit[currentX * 2] == true {
                queue.enqueue(element: currentX * 2)
                visit[currentX * 2] = false
            }
        }
        cnt += 1
    }
    return cnt
}

print(bfs())


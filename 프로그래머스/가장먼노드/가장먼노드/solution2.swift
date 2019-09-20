//
//  solution2.swift
//  가장먼노드
//
//  Created by youngjun goo on 20/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation



public struct Queue2<T> {
    fileprivate var array = [T]() //제네릭 타입의 배열 생성
    
    public var front: T? { return array.first } // Queue의 맨 앞 부분은 first , 반환 타입은 Queue의 element기 때문에 T
    public var count: Int { return array.count }
    public var isEmpty: Bool { return array.isEmpty }
    // 실제 구조체의 프로퍼티에 접근해 값을 바꾸기 떄문에 mutating 키워드를 써주어야 한다.
    public mutating func enqueue(_ element: T) { array.append(element) }
    public mutating func dequeue() -> T? { return isEmpty ? nil : array.removeFirst() }
    public mutating func clear() { array.removeAll() }
    
}


func solution2(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var visited = Array<Int>(repeating: 0, count: n)
    var graph = [[Int]](repeating: Array<Int>(), count: n)
    
    for node in edge {
        let index: (v1: Int, v2: Int) = (node[0] - 1, node[1] - 1)
        // 비방향 그래프기 때문에 양쪽을 연결
        graph[index.v1].append(index.v2)
        graph[index.v2].append(index.v1)
        
    }
    
    findShortestPath(n: n, visited: &visited, graph: graph)
    
    var answer = 0
    visited.sort { $0 > $1 }
    for edge in visited where edge == visited.first {
        answer = answer + 1
    }
    
    return answer
}

func findShortestPath(n: Int, visited: inout [Int], graph: [[Int]]) {
    visited[0] = 1
    
    var queue = Queue2<Int>()
    // 현재 출발 지점 vertex 삽입
    queue.enqueue(0)
    
    while !queue.isEmpty {
        guard let curVertex = queue.front else { break }
        queue.dequeue()
        
        for index in graph[curVertex] where visited[index] < 1 {
            queue.enqueue(index)
            visited[index] = visited[curVertex] + 1
        }
        
    }
}



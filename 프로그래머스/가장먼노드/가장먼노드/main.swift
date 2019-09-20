//
//  main.swift
//  가장먼노드
//
//  Created by youngjun goo on 20/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


public struct Queue<T> {
    
    fileprivate var elements = [T]()
    
    public init() {}
    //FIFO 구조 이기에 배열 제일 앞부분의 데이터를 반환
    mutating public func dequeue() -> T? {
        return elements.removeFirst()
    }
    
    mutating public func enqueue(element: T) {
        elements.append(element)
    }
    
    public func peek() -> T? {
        return elements.first
    }
    //큐 빈상태로 만들기
    mutating public func clear() {
        elements.removeAll()
    }
    
    public var capacity: Int {
        get {
            return elements.capacity
        }
        set {
            elements.reserveCapacity(newValue)
        }
    }
    
    public var count: Int {
        return elements.count
    }
    //Queue 구조체내에서 값을 반환 하는 프로퍼티를 선언하고 다시 참조 가능
    public func isFull() -> Bool {
        return count == elements.capacity
    }
    
    public func isEmpty() -> Bool {
        return elements.isEmpty
    }
}

struct Graph {
    let v1: Int
    let v2: Int
    
    public init(v1: Int, v2: Int) {
        self.v1 = v1
        self.v2 = v2
    }
}

var queue = Queue<Int>()
var adjList = [Graph]()
var vertexList = Array<Int>()
var visited = Array<Bool>()
var answer = 0

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    bfs(n: n, edge: edge)
    
    return answer
}

func bfs(n: Int, edge: [[Int]]) {
    // vertex 초기화
    var max = 0
    for _ in 0...n {
        vertexList.append(0)
        visited.append(true)
    }
    // 인접그래프 생성
    for i in 0..<edge.count {
        adjList.append(Graph(v1: edge[i][0], v2: edge[i][1]))
    }
    // 1번 넣기
    queue.enqueue(element: 1)
    visited[1] = false
    
    while (!queue.isEmpty()) {
        let curVertex = queue.dequeue()
        for i in 0..<adjList.count {
            // 갈수 있는 길이 있다면 갯수를 하나 늘리고
            if adjList[i].v1 == curVertex  && visited[adjList[i].v2] == true {
                vertexList[adjList[i].v2] =  vertexList[adjList[i].v1] + 1
                queue.enqueue(element: adjList[i].v2 )
                visited[adjList[i].v2] = false
                // 최대값 변경
                if max < vertexList[adjList[i].v2] {
                    max = vertexList[adjList[i].v2]
                }
            }
            if adjList[i].v2 == curVertex  && visited[adjList[i].v1] == true {
                vertexList[adjList[i].v1] =  vertexList[adjList[i].v2] + 1
                queue.enqueue(element: adjList[i].v1 )
                visited[adjList[i].v1] = false
                // 최대값 변경
                if max < vertexList[adjList[i].v1] {
                    max = vertexList[adjList[i].v1]
                }
            }
        }
    }
    
    for i in 0..<vertexList.count {

        if max == vertexList[i] {
            answer = answer + 1
        }
    }
    
}





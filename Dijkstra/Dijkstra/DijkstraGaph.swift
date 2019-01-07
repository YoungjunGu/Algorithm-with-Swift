//
//  main.swift
//  Dijkstra
//
//  Created by youngjun goo on 06/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public class DijkstraGraph<T: Hashable & Equatable> {
    public var nodes: [DijkstraNode<T>]
    public init(nodes: [DijkstraNode<T>]) {
        self.nodes = nodes
    }

public static func dijkstraPath(startNode: DijkstraNode<T>, graph: DijkstraGraph<T>, finishNode: DijkstraNode<T>) {
    //미방문 한 노드들을 저장하기 위한 Set
    var unvisitedNodes = Set<DijkstraNode<T>>(graph.nodes)
    //초기 시작 노드는 거리가 0
    startNode.distance = 0
    //현재 노드 저장
    var currentNode = startNode

    //도착 지점이 true 즉 방문할 때까지 반복
    while  finishNode.visited == false {
        
        for edge in currentNode.edges.filter({ (edge) -> Bool in
            return edge.to.visited == false
        }) {
            //핵심 : 현재 노드와 인접한 이웃 노드들 과의 임시 거리를 계산
            let temporaryDistance = currentNode.distance + Int(edge.weight)
            
            //임시 거리가 현재 이웃과의 거리보다 작으면
            //임시 거리로 업데이트
            if edge.to.distance > temporaryDistance {
                edge.to.distance = temporaryDistance
                edge.to.previous = currentNode

            }

        }
        //해당 노드는 방문 했기에 visited = true
        currentNode.visited = true
        
        //미방문 노드 Set에서 현재 노드를 삭제 -> 방문한건 다시 방문 하지 않는다.
        unvisitedNodes.remove(currentNode)
        
        if let newCurrent = unvisitedNodes.sorted(by: { (nodeA, nodeB) -> Bool in
            nodeA.distance < nodeB.distance
        }).first {
            currentNode = newCurrent
        } else {
            break
        }
    }

    DijkstraGraph.printShortestPath(node: finishNode)
    print()
    }
    
}

extension DijkstraGraph {
    public static func printShortestPath(node: DijkstraNode<T>) {
        if let previous = node.previous {
            DijkstraGraph.printShortestPath(node: previous)
        } else {
            print("Shortest Path: ")
        }
        print("->\(node.value)",terminator: "")
    }
}

//
//  MSTGraph.swift
//  Prim
//
//  Created by youngjun goo on 13/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public class MSTGraph<T: Hashable & Equatable> {
    public var nodes: [MSTNode<T>]
    public init(nodes: [MSTNode<T>]) {
        self.nodes = nodes
    }
    
    //Prim Algorithm
    public static func MST(startNode: MSTNode<T>, grph: MSTGraph<T>) {
        //한번 방문한 노드는 재방문 하지 않기 위해 visitedNode 배열 추가
        var visitedNodes = [MSTNode<T>]()
        
        print(startNode.value)
        visitedNodes.append(startNode)
        //시작 노드는 방문 배열에 추가 한다음 재방문 하지 않기 위해 visited 프로퍼티 true로 초기화
        startNode.visited = true
        //그래프의 모든 노드를 방문할때 까지 수행
        while visitedNodes.count < grph.nodes.count {
            var unvisitedEdges = [MSTEdge<T>]()
            //함수형 프로그래밍 설명 -> 블로그 참조 :https://blog.naver.com/guyeongjun/221441194067
            _ = visitedNodes.map({ (node) -> () in
                let edges = node.edges.filter( { (edge) -> Bool in
                    edge.to.visited == true
                })
                unvisitedEdges.append(contentsOf: edges)
            })
            if let minimumUnvisitedEdge = unvisitedEdges.sorted(by: { (edgeA, edgeB) -> Bool in
                edgeA.weight < edgeB.weight
            }).first {
                print("\(minimumUnvisitedEdge.from.value) <-----> \(minimumUnvisitedEdge.to.value)")
                minimumUnvisitedEdge.to.visited = true
                visitedNodes.append(minimumUnvisitedEdge.to)
            }
        }
    }
}

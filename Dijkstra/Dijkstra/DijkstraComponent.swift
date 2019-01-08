//
//  Dijkstra.swift
//  Dijkstra
//
//  Created by youngjun goo on 06/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


public class DijkstraNode<T: Equatable & Hashable>: Equatable {
    public var value: T
    public var edges: [DijkstraEdge<T>]
    public var visited: Bool
    
    public var distance = Int.max
    
    public var previous: DijkstraNode<T>?
    
    public init(value: T, edges: [DijkstraEdge<T>], visited: Bool) {
        self.value = value
        self.edges = edges
        self.visited = visited
    }
}

extension DijkstraNode: Hashable {
    public var hashValue: Int {
        get {
            return value.hashValue
        }
    }
}

public func ==<T: Equatable>(lhs: DijkstraNode<T>, rhs: DijkstraNode<T>) -> Bool {
    guard lhs.value == rhs.value else {
        return false
    }
    return true
}






public class DijkstraEdge<T: Equatable & Hashable>: Equatable {
    public var from: DijkstraNode<T>
    public var to: DijkstraNode<T>
    //양수의 weight 만 가능하다
    public var weight: Double
    
    public init(weight: Double, from: DijkstraNode<T>, to: DijkstraNode<T>) {
        self.weight = weight
        self.from = from
        self.to = to
        from.edges.append(self)
    }
}

extension DijkstraEdge: Hashable {
    public var hashValue: Int {
        get {
            let stringHash = "\(from.value) -> \(to.value)"
            return stringHash.hashValue
        }
    }
}


public func ==<T: Equatable>(lhs: DijkstraEdge<T>, rhs: DijkstraEdge<T>)-> Bool {
    guard lhs.from.value == rhs.from.value else {
        return false
    }
    guard lhs.to.value == rhs.to.value else {
        return false
    }
    return true
}





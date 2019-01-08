//
//  Vertex.swift
//  BFS
//
//  Created by youngjun goo on 02/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public class Vertex: CustomStringConvertible, Equatable {
    
    public var neigbors: [Edge]
    
    public private(set) var data: String
    public var distance: Int?
    //방문 여부를 판단하는 Bool 값
    public var visited: Bool
    
    public init(_ data: String) {
        self.data = data
        neigbors = []
        visited = false
    }
    //정점을 설명하기 위한 
    public var description: String {
        if let distance = distance {
            return "Vertex(data: \(data), distance: \(distance))"
        }
        return "Vertex(data: \(data), distance: 무한대)"
    }
    
    public var hasDistance: Bool {
        return distance != nil
    }
    
    public func remove(_ edge: Edge) {
        neigbors.remove(at: neigbors.index { $0 == edge }!)
    }
}

public func ==(_ lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.data == rhs.data && lhs.neigbors == rhs.neigbors
}

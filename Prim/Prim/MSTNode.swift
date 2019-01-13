//
//  main.swift
//  Prim
//
//  Created by youngjun goo on 11/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public class MSTNode<T: Equatable & Hashable> {
    
    public var value: T
    public var edges: [MSTEdge<T>]
    public var visited: Bool
    
    //initialize
    public init(value: T,edges: [MSTEdge<T>], visited: Bool) {
        self.value = value
        self.edges = edges
        self.visited = visited
    }
}


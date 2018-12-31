//
//  treeNode.swift
//  DFS
//
//  Created by youngjun goo on 31/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

public class treeNode<T> {
    public var data: T
    public var children = Array<treeNode>()
    public init(_ data: T) {
        self.data = data
    }
    
    public func addNode(_ child: treeNode) {
        children.append(child)
    }
    
    
    public func depthFirstSearch(visit: (treeNode) -> Void) {
        visit(self)
        
        children.forEach {
            $0.depthFirstSearch(visit: visit)
        }
    }
}

//
//  MSTEdge.swift
//  Prim
//
//  Created by youngjun goo on 11/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public class MSTEdge<T: Equatable & Hashable>: Equatable {
    
    public var from: MSTNode<T>
    public var to: MSTNode<T>
    public var weight: Double
    
    public init(from: MSTNode<T>, to:MSTNode<T>, weight: Double) {
        self.from = from
        self.to = to
        self.weight = weight
        from.edges.append(self)
    }
}

public func ==<T: Equatable>(lhs: MSTEdge<T>, rhs: MSTEdge<T>) -> Bool {
    guard lhs.from.value == rhs.from.value else {
        return false
    }
    guard lhs.to.value == rhs.to.value else {
        return false
    }
    return true
}

//출력을 위한 hashValue를 setting
extension MSTEdge: Hashable {
    public var hashValue: Int {
        get {
            let stringHash = "\(from.value) -> \(to.value)"
            return stringHash.hashValue
        }
    }
}



//
//  main.swift
//  DFS
//
//  Created by youngjun goo on 30/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

var visited = [-1, 0, 0, 0, 0, 0, 0, 0, 0]

let root = treeNode(1)
let node2 = treeNode(2)
let node3 = treeNode(3)
let node4 = treeNode(4)
let node5 = treeNode(5)
let node6 = treeNode(6)
let node7 = treeNode(7)
let node8 = treeNode(8)

root.addNode(node2)
root.addNode(node3)
node2.addNode(node4)
node2.addNode(node5)
node3.addNode(node6)
node3.addNode(node7)
node4.addNode(node8)
node5.addNode(node8)
node6.addNode(node8)
node7.addNode(node8)

root.depthFirstSearch {
    //아직 방문 안했다면
    let vertex = $0.data
    if visited[vertex] == 0 {
        visited[vertex] = -1
        print(vertex)
    }
}


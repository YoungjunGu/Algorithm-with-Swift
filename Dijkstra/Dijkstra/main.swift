//
//  main.swift
//  Dijkstra
//
//  Created by youngjun goo on 07/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

let nodeA = DijkstraNode(value: "Boston", edges: [], visited: false)
let nodeB = DijkstraNode(value: "New York", edges: [], visited: false)
let nodeC = DijkstraNode(value: "Chicago", edges: [], visited: false)
let nodeD = DijkstraNode(value: "New Orleans", edges: [], visited: false)
let nodeE = DijkstraNode(value: "Miami", edges: [], visited: false)
let nodeF = DijkstraNode(value: "Denver", edges: [], visited: false)
let nodeG = DijkstraNode(value: "San Francisco", edges: [], visited: false)
let nodeH = DijkstraNode(value: "Los Angeles", edges: [], visited: false)

let edgeAB = DijkstraEdge(weight: 250, from: nodeA, to: nodeB)
let edgeAC = DijkstraEdge(weight: 1500, from: nodeA, to: nodeC)
let edgeBC = DijkstraEdge(weight: 1000, from: nodeB, to: nodeC)
let edgeBD = DijkstraEdge(weight: 1400, from: nodeB, to: nodeD)
let edgeBE = DijkstraEdge(weight: 900, from: nodeB, to: nodeE)
let edgeCF = DijkstraEdge(weight: 1200, from: nodeC, to: nodeF)
let edgeDH = DijkstraEdge(weight: 1700, from: nodeD, to: nodeH)
let edgeFG = DijkstraEdge(weight: 800, from: nodeF, to: nodeG)
let edgeFH = DijkstraEdge(weight: 1000, from: nodeF, to: nodeH)
let edgeGH = DijkstraEdge(weight: 300, from: nodeG, to: nodeH)



let graph = DijkstraGraph(nodes: [nodeA,nodeB,nodeC,nodeD,nodeE,nodeF,nodeG,nodeH])

DijkstraGraph.dijkstraPath(startNode: nodeA, graph: graph, finishNode: nodeH)

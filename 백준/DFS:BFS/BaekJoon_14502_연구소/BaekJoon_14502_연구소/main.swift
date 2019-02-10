//
//  main.swift
//  BaekJoon_14502_연구소
//
//  Created by youngjun goo on 06/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var row: Int = 0
var col: Int = 0
var map = [[Int]](repeating: Array(repeating: 0, count: 8), count: 8)
var visit = [[Int]](repeating: Array(repeating: 0, count: 8), count: 8)

var read = readLine()
let sizeString = read?.components(separatedBy: " ")

row = Int(sizeString![0])!
col = Int(sizeString![1])!






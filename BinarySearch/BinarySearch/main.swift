//
//  main.swift
//  BinarySearch
//
//  Created by youngjun goo on 29/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

var dataList = [-1, 0, 1, 2, 3, 4, 5, 7, 8, 10, 13, 15, 17, 20]

func binarySearch<T: Comparable>(array: inout [T], target: inout T) -> Int? {
    var first = 0
    var last = array.count - 1
    var mid = 0
    
    while first <= last {
        mid = (first + last) / 2;
        if array[mid] == target {
            return mid
        } else if(array[mid] > target) {
            last = mid - 1
        } else {
            first = mid + 1
        }
    }
    return -1
}

var target = 10

let checkBS = binarySearch(array: &dataList, target: &target)
if(checkBS == -1) {
    print("Not Found!")
} else {
    print(checkBS!)
}

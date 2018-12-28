//
//  main.swift
//  QuickSort
//
//  Created by youngjun goo on 28/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
    var q = startIndex
    for index in startIndex..<endIndex {
        if array[index] < array[endIndex] {
            array.swapAt(q, index)
            q += 1
        }
    }
    array.swapAt(q, endIndex)
    
    return q
}


func quickSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
    if startIndex >= endIndex {
        return
    }
    let placedItemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
    quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex-1)
    quickSort(array: &array, startIndex: placedItemIndex+1, endIndex: endIndex)
}

func quickSort<T: Comparable>(array: inout [T]) {
    quickSort(array: &array, startIndex: 0, endIndex: array.count-1)
}

var dataList = [44, 24, 33, 1, 5, 24, 77, 51, -1, 30, 50, 12, 7, 10]

quickSort(array: &dataList)

for i in 0..<dataList.count {
    print(dataList[i])
}

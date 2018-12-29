//
//  main.swift
//  InsertionSort
//
//  Created by youngjun goo on 28/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

var dataList = [14, 50, 12, -9, 10, -3, 46, 37, 51, 44, 6, 3, 1]

func insertionSort<T: Comparable>(array: inout [T]) {
    for i in 1..<array.count {
        insert(value: array[i], array: &array, rightIndex: i-1)
    }
}

func insert<T: Comparable>(value: T, array: inout [T], rightIndex: Int) {
    
    var index = rightIndex
    
    while index >= 0 && value < array[index] {
        array[index+1] = array[index]
        index -= 1
    }
    array[index + 1] = value
}

insertionSort(array: &dataList)


//출력 부분
for i in 0..<dataList.count{
    print(dataList[i])
}

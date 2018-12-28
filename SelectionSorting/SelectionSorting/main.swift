//
//  main.swift
//  SelectionSorting
//
//  Created by youngjun goo on 26/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

var arr = [9, 8, 7, 6, 5, 4, 3, 2, 1]

for i in 0..<arr.count{
    var min = arr[i]
    var index = i
    for j in i+1..<arr.count{
        
        if(min>arr[j])
        {
            min = arr[j]
            index = j;
        }
    }
    if i != index{
        arr.swapAt(i, index)
    }
}

for i in 0..<arr.count{
    print(arr[i])
}


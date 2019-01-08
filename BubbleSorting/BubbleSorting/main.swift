//
//  main.swift
//  BubbleSorting
//
//  Created by youngjun goo on 27/12/2018.
//  Copyright © 2018 youngjun goo. All rights reserved.
//

import Foundation

var dataList = [10, 20 , 3 , 5 ,4 ,7, 17, 30, 1]


for i in stride(from: dataList.count-1, through: 0, by: -1){
    for j in 0..<i {
        if dataList[j] > dataList[j+1]
        {
            dataList.swapAt(j, j+1)
        }
    }
}

for i in stride(from: 0, through: dataList.count-1, by: 1){
    print(dataList[i])
}


//
//  main.swift
//  ClosureTest
//
//  Created by youngjun goo on 01/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

let names: [String] = ["x","c","b","a","k"]

//func backwards(first: String, second: String) -> Bool {
//    print("\(first) \(second) 비교 중")
//    return first < second
//}

let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first < second
})
print(reversed)





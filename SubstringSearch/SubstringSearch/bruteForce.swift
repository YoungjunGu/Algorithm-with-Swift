//
//  main.swift
//  SubstringSearch
//
//  Created by youngjun goo on 20/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public func bruteForce(search pattern: [Character], in text: [Character]) {
    //찾고자 하는 subString pattern 의 길이
    let m = pattern.count - 1
    //전체 text의 길이
    let n = text.count - 1
    
    for index in 0...n - m {
        //
        let match = text[index ... index + m]
        print(match)
        if match == pattern[0 ... m] {
            print("Pattern found")
        }
    }
}

public func bruteForceString(search pattern: String, in text: String) {
    
    let m = pattern.count - 1
    let n = text.count - 1
    
    for index in 0...n - m {
        let start = text.index(text.startIndex, offsetBy: index)
        let end = text.index(text.startIndex, offsetBy: index + m)
        let match = text[start ... end]
        print(match)
        
        if match == pattern {
            print("Pattern found")
        }
    }
}


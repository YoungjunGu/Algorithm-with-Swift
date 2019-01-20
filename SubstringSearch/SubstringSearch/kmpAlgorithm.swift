//
//  kmpAlgorithm.swift
//  SubstringSearch
//
//  Created by youngjun goo on 20/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

class KnuthMorrisPartt {
    
    class func failFunction(_ str: [String]) -> [Int] {
        let n = str.count
        
        var pi = Array(repeating: 0, count: n + 1)
        var k: Int = -1
        pi[0] = -1
        
        for i in 0..<n {
            while (k >= 0 && (str[str.index(str.startIndex, offsetBy: k)] != str[str.index(str.startIndex, offsetBy: i)])) {
                k = pi[k]
            }
            k+=1
            pi[i + 1] = k
        }
        return pi
    }
    
    class func kmp(search pattern: String, in text: String) -> [Int] {
        
        var patternString = pattern.map { String($0) }
        var textString = text.map { String($0) }
        
        var matches = [Int]()
        let n = textString.count
        let m = patternString.count
        var k = 0
        var pi = failFunction(patternString)
        
        for i in 0..<n {
            while(k >= 0 && (k == m || patternString[k] != textString[i])) {
                k = pi[k]
            }
            k += 1
            if k == m {
                matches.append(i - m + 1)
            }
        }
        return matches
    }
    
}

//
//  main.swift
//  Programmers_올바른괄호
//
//  Created by youngjun goo on 2019/10/11.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public struct Stack<T> {
    fileprivate var elements = [T]()
    
    public init() {}
    
    mutating public func pop() -> T? {
        return self.elements.popLast()
    }
    
    mutating public func push(element: T) {
        self.elements.append(element)
    }
    
    public func count() -> Int {
        return self.elements.count
    }
    
    public func isEmpty() -> Bool {
        return elements.isEmpty
    }
}

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var stack = Stack<Character>()
    let strArr: [Character] = s + []
    
    for i in 0..<strArr.count {
        if strArr[i] == "(" {
            stack.push(element: "(")
        }
        if strArr[i] == ")" {
            if stack.isEmpty() {
                return false
            } else {
                let _ = stack.pop()
            }
        }
    }
    
    if stack.count() > 0 {
        ans = false
    } else {
        ans = true
    }
    
    return ans
}

let s = "(())()"

print(solution(s))


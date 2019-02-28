//
//  main.swift
//  Programmers_정렬_쇠막대기
//
//  Created by youngjun goo on 28/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

//Array를 이용한 Stack
public struct ArrayStack<T> {
    //소속 소스파일 내에 접근해야 하기 때문에 접근자 : fileprivate
    //stackArray는 다양한 자료형을 담아야 하기 때문에 제네릭 사용 필수
    fileprivate var elements = [T]()
    
    public init() {}
    
    mutating public func pop() -> T? {
        return self.elements.popLast()
    }
    mutating public func push(element: T) {
        self.elements.append(element)
    }
    //Stack의 정점을 추가
    //last는 배열의 마지막을 반환 한다.
    public func peek() -> T? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    public var count: Int {
        return self.elements.count
    }
    
}

func solution() -> Int {
    //입력 저장 배열
    var cnt: Int = 0
    let inputString = readInput()
    var stack = ArrayStack<String>()

    for i in 0..<inputString.count {
        // ( 이면 push
        if inputString[i] == "(" {
            stack.push(element: "(")
        } else {
            // ) 이면 stack pop 하고 남은 개수 더하기
            stack.pop()
            cnt += stack.count
        }
    }

    return cnt
}

func readInput() -> [String] {
    let read = readLine()
    let inputString = read?.components(separatedBy: " ")
    
    return inputString!
}


print(solution())


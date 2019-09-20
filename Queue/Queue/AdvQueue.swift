//
//  Queue.swift
//  Queue
//
//  Created by youngjun goo on 20/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


public struct Queue2<T> {
    fileprivate var array = [T]() //제네릭 타입의 배열 생성
    
    public var front: T? { return array.first } // Queue의 맨 앞 부분은 first , 반환 타입은 Queue의 element기 때문에 T
    public var count: Int { return array.count }
    public var isEmpty: Bool { return array.isEmpty }
    // 실제 구조체의 프로퍼티에 접근해 값을 바꾸기 떄문에 mutating 키워드를 써주어야 한다.
    public mutating func enqueue(_ element: T) { array.append(element) }
    public mutating func dequeue() -> T? { return isEmpty ? nil : array.removeFirst() }
    public mutating func clear() { array.removeAll() }
    
}


public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var peek: T? { return array.last }
    public var count: Int { return array.count }
    public var isEmpty: Bool { return array.isEmpty }
    
    public mutating func push(_ element: T) { array.append(element) }
    public mutating func pop() -> T? { return array.popLast() }
    public mutating func clear() { array.removeAll() }
}

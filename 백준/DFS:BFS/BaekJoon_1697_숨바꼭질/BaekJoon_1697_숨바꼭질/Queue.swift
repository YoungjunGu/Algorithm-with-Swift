//
//  Queue.swift
//  BaekJoon_1697_숨바꼭질
//
//  Created by youngjun goo on 27/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public struct Queue<T> {
    
    fileprivate var elements = [T]()
    
    public init() {}
    //FIFO 구조 이기에 배열 제일 앞부분의 데이터를 반환
    mutating public func dequeue() -> T? {
        return elements.removeFirst()
    }
    
    mutating public func enqueue(element: T) {
        elements.append(element)
    }
    
    public func peek() -> T? {
        return elements.first
    }
    //큐 빈상태로 만들기
    mutating public func clear() {
        elements.removeAll()
    }
    
    public var capacity: Int {
        get {
            return elements.capacity
        }
        set {
            elements.reserveCapacity(newValue)
        }
    }
    
    public var count: Int {
        return elements.count
    }
    //Queue 구조체내에서 값을 반환 하는 프로퍼티를 선언하고 다시 참조 가능
    public func isFull() -> Bool {
        return count == elements.capacity
    }
    
    public func isEmpty() -> Bool {
        return elements.isEmpty
    }
}

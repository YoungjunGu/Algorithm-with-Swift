//
//  PriorityQueue.swift
//  PriorityQueue
//
//  Created by youngjun goo on 2019/10/25.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public struct PriorityQueue<T: Comparable> {
    private var heap = [T]()
    private let ordered: (T, T) -> Bool
    
    public init(ascending: Bool = false, startingValues: [T] = []) {
        if ascending {
            ordered = { a,b in a > b }
        } else {
            ordered = { a,b in a < b }
        }
        
        heap = startingValues
        var i = (heap.count / 2) - 1
        while i >= 0 {
            adjust(i)
            i = i - 1
        }
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public mutating func push(_ element: T) {
        heap.append(element)
        heapSort(heap.count - 1)
    }
    
    public mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        let root = heap.first
        heap.swapAt(0, heap.count - 1)
        _ = heap.removeLast()
        adjust(0)
        return root
    }
    
    public mutating func remove(_ item: T) {
        if let index = heap.firstIndex(of: item) {
            heap.swapAt(index, heap.count - 1)
            heap.removeLast()
            heapSort(index)
            adjust(index)
        }
    }
    
    public mutating func removeAll(_ item: T) {
        var lastCount = heap.count
        remove(item)
        while heap.count < lastCount {
            lastCount = heap.count
            remove(item)
        }
    }
    
    public func peek() -> T? {
        return heap.first
    }
    
    public mutating func clear() {
        heap.removeAll(keepingCapacity: false)
    }
    
    private mutating func adjust(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1
            if j < (heap.count - 1) && ordered(heap[j], heap[j + 1]) { j = j + 1 }
            if !ordered(heap[index], heap[j]) { break }
            heap.swapAt(index, j)
            index = j
        }
    }
    
    private mutating func heapSort(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}

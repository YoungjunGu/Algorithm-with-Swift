//
//  Trie.swift
//  Trie
//
//  Created by youngjun goo on 2019/11/07.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


public class TrieNode<Key: Hashable> {
    // 노드의 데이터
    public var key: Key?
    // 부모 노드
    public weak var parent: TrieNode?
    // 내 하위 자식 노드의 Dictionary ex) car -> card, carbon, cardi..... 등
    public var children: [Key: TrieNode] = [:]
    // 끝을 나타내는것 : leaf 노드
    public var isLeafNode = false
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    
    private let root = Node(key: nil, parent: nil)
    
    public init() { }
    
    // 삽입
    public func insert(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isLeafNode = true
    }
    
    // 트라이에 찾고자하는 단어가 포함되는지 판단하는 함수
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { return false }
            current = child
        }
        return current.isLeafNode
    }
    
    // 삭제
    public func remove(_ collection: CollectionType) {
        
        var current = root
        for element in collection {
            guard let child = current.children[element] else { return }
            current = child
        }
        guard current.isLeafNode else { return print("완성 단어가 아님.") }
        current.isLeafNode = false
        while current.children.isEmpty && !current.isLeafNode{
            current.parent!.children[current.key!] = nil
            current = current.parent!
        }
    }
}

extension Trie where CollectionType: RangeReplaceableCollection {
    // RangeReplaceableCollection 프로토콜은 Collection 프로토콜을 상속한 프로토콜
    // Array의 append 메서드가 Array 컬렉션이 이 프로토콜을 채택했기 때문에 사용할 수 있는 것
    
    public func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else { return [] }
            current = child
        }
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType,
                             after node: Node) -> [CollectionType]
    {
        var result = [CollectionType]()
        if node.isLeafNode {
            result.append(prefix)
        }
        for child in node.children.values {

            var prefix = prefix
            prefix.append(child.key!)

            result.append(contentsOf: collections(startingWith: prefix, after: child))
        }
        return result
    }
    
}


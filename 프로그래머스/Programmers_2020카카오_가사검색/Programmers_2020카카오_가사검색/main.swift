//
//  main.swift
//  Programmers_2020카카오_가사검색
//
//  Created by youngjun goo on 2019/11/07.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ words:[String], _ queries:[String]) -> [Int] {

    var postDict: [String: Int] = [:]
    var preDict: [String: Int] = [:]

    for word in words {
        if postDict[String(word.reversed())] == nil {
             postDict[String(word.reversed())] = 0
        }
         postDict[String(word.reversed())]! += 1

        if preDict[word] == nil {
            preDict[word] = 0
        }
        preDict[word]! += 1
    }

    let prefixTrie = initPrefixTrie(words)
    let postfixTrie = initPostfixTrie(words)

    return check(prefixTrie, postfixTrie, queries, preDict, postDict)
}
// MARK:-  트라이 생성
// 전위
func initPrefixTrie(_ words: [String]) -> Trie<String> {

    let trie = Trie<String>()
    words.forEach { word in trie.insert(word) }

    return trie
}
// 후위
func initPostfixTrie(_ words: [String]) -> Trie<String> {

    let trie = Trie<String>()
    words.forEach { word in trie.insert(String(word.reversed())) }
    return trie
}

// 가사 검색
func check(_ prefixTrie: Trie<String>,
           _ postfixTrie: Trie<String>,
           _ queries: [String],
           _ preDict: [String: Int],
           _ postDict: [String: Int]) -> [Int]
{
    var answer: [Int] = []

    queries.forEach { query in
        var sameCnt: Int = 0
        let strCnt = query.count
        let removeQm: String = query.replacingOccurrences(of: "?", with: "")

        // postfix
        if query[0] != "?" {
            let prefix = prefixTrie.collections(startingWith: removeQm)
            for element in prefix where element.count == strCnt {
                if preDict[element] != 1 {
                    sameCnt += preDict[element]! - 1
                }
                sameCnt += 1
            }
        } else {   // prefix
            let postfix = postfixTrie.collections(startingWith: removeQm)
            for element in postfix where element.count == strCnt {
                if postDict[element] != 1 {
                    sameCnt += postDict[element]! - 1
                }
                sameCnt += 1
            }
        }
        answer.append(sameCnt)
    }
    return answer
}

// MARK:- String Extension
extension String {
    subscript(r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy:  r.upperBound)

        return String(self[start..<end])
    }
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

// MARK:- Trie
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


let word = ["frodo","prodo","frod"]
let queries = ["fro??", "????o", "fr???", "fro???", "pro?","pro??"]

print(solution(word, queries))


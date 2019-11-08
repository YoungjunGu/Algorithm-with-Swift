//
//  shortCoding.swift
//  Programmers_2020카카오_가사검색
//
//  Created by youngjun goo on 2019/11/08.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ words: [String], _ queries: [String]) -> [Int] {
    
    var answer: [Int] = []
    
    let prefixTrie = Trie()     // 전위
    let postfixTrie = Trie()    // 후위
    
    words.forEach { word in
        prefixTrie.insert(String(word))
        postfixTrie.insert(String(word.reversed()))
    }
    
    queries.forEach { query in
        // 첫글자 ? 이면 접미 postfix
        if query[0] != "?" {
            answer.append(prefixTrie.search(query))
        } else {
            answer.append(postfixTrie.search(String(query.reversed())))
        }
    }
    return answer
}

public class Trie {
    var next: [Trie?] = Array(repeating: nil, count: 26)
    var isLeafnode: Bool = false    // 리프노드 체크
    var depth: [Int: Int] = [:]
    
    func insert(_ word: String) {
        let chars: [Character] = Array(word)
        
        insertReculsive(chars, 0)
    }
    
    private func insertReculsive(_ chars: [Character], _ index: Int) {
        // 재귀 종료 조건
        if index == chars.count {
            isLeafnode = true
            return
        }
        // 깊이 저장
        recordDepth(chars, index)
        let curIndex = Int(chars[index].asciiValue! - Character("a").asciiValue!)
        
        guard let nextNode = next[curIndex] else {
            // 없으면 새로 생성하고 삽입
            next[curIndex] = Trie()
            next[curIndex]?.insertReculsive(chars, index + 1)
            return
        }
        // 있으면 계속해서 삽입
        nextNode.insertReculsive(chars, index + 1)
    }
    
    func search(_ word: String) -> Int {
        let chars: [Character] = Array(word)
        
        return searchReculsive(chars, 0)
    }
    
    private func searchReculsive(_ chars: [Character], _ index: Int) -> Int {
        // 리프노드 까지 도달 했으면 1 아니면 0 을 반환 -> 리프 노드 까지 도달했다는건 search가 되었다는 말
        if chars.count == index {
            if isLeafnode {
                return 1
            } else {
                return 0
            }
        }
        let curDepth: Int = chars.count - index - 1
        var total: Int = 0
        // ?를 만나면
        if chars[index] == Character("?") {
            if depth[curDepth] != nil {
                total += depth[curDepth]!
            }
        } else {
            let curIndex = Int(chars[index].asciiValue! - Character("a").asciiValue!)
            if let nextNod = next[curIndex] {
                total += nextNod.searchReculsive(chars, index + 1)
            }
        }
        
        return total
    }
    
    private func recordDepth(_ chars: [Character], _ index: Int) {
        let curDepth: Int = chars.count - index - 1
        guard let count = depth[curDepth] else {
            depth[curDepth] = 1
            return
        }
        depth[curDepth] = count + 1
        return
    }
}

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





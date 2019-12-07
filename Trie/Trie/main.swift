//
//  main.swift
//  Trie
//
//  Created by youngjun goo on 2019/11/07.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

let trie = Trie<String>()

trie.insert("car")

trie.insert("card")
trie.insert("care")
trie.insert("carbon")
trie.insert("app")
trie.insert("ban")
trie.insert("apple")
trie.insert("banana")

print(trie.collections(startingWith: "c").count)

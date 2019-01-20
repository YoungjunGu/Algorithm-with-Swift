//
//  test.swift
//  SubstringSearch
//
//  Created by youngjun goo on 20/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var text: [Character] = ["a", "b", "c", "d", "e", "f"]
var pattern: [Character] = ["c", "d"]

var textString: String = "I love swift and iOS with gaki"
var patternString: String = "swift"


//bruteForce(search: pattern, in: text)
//bruteForceString(search: patternString, in: textString)

let findSubStringIndex = KnuthMorrisPartt.kmp(search: patternString, in: textString)

print(findSubStringIndex)

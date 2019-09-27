import UIKit


var str = "1D#2S*3S"

let getIndex: [Int] = str.enumerated().reduce([]) { acc, cur in
    if cur.element == "*" || cur.element == "#" {
        return acc + [cur.offset]
    }
    return acc
}

print(getIndex) // [2, 5] 

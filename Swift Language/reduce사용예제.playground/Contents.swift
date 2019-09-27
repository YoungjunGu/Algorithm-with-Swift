import Foundation

let numbers: [Int] = [1, 2, 3]

//
//var sum: Int = numbers.reduce(0) {
//    print("\($0) + \($1)" )
//    return $0 + $1
//}
//    0 + 1
//    1 + 2
//    3 + 3

//print(sum) // 6
//
//
//let company: [String] = ["NAVER", "Samsung" ,"Kakao", "LINE"]
//
//let redueceCompany: String = company.reduce("Korea Company: ") {
//    return $0 + " " + $1
//}
//
//print(redueceCompany)

var doubledNubmers: [Int] = numbers.reduce(into: []) { (result: inout [Int], element: Int) in
    print("result : \(result), element: \(element)")
    
    guard element % 2 == 0 else {
        return
    }
    
    print("\(result) append \(element)")
    
    result.append(element * 2)
}
//result : [1, 2], element: 1
//result : [1, 2], element: 2
//[1, 2] append 2
//result : [1, 2, 4], element: 3
//[1, 2, 4]

// doubledNubmers = [1, 2] + numbers.filter{ $0 % 2 == 0 }.map{ $0 * 2 }

print(doubledNubmers)

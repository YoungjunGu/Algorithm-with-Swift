import Foundation



//
//let numbers: [Int] = [0, 1, 2, 3, 4]
//
//var doubledNumber: [Int] = [Int]()
//var stringNumber: [String] = [String]()
//
//for number in numbers {
//    doubledNumber.append(number * 2)
//    stringNumber.append(String(number))
//}
//
//
//doubledNumber = numbers.map({ (number: Int) -> Int in
//    return number * 2
//})
//
//// 클로저를 이용하여 코드를 간결화
//doubledNumber = numbers.map{ $0 * 2 }
//
//stringNumber = numbers.map({ (number: Int) -> String in
//    return String(number)
//})
//
//stringNumber = numbers.map{ return String($0)}

// Filter

let numbers: [Int] = [0, 1, 2, 3, 4, 5]
//var evenNumbers: [Int] = [Int]()
//
//// for 구문 사용
//for number in numbers {
//  if number % 2 != 0 { continue }
//  evenNumbers.append(number)
//}

// print(evenNumbers) // [0, 2, 4] 


let mappedNumbers: [Int] = numbers.map{ $0 + 3}
//
////var evenNumbers: [Int] = mappedNumbers.filter { (number: Int) -> Bool in
////    return number % 2 == 0
////}
//
//let evenNumbers = mappedNumbers.filter{ $0 % 2 == 0 }
//let oddNumbers = mappedNumbers.filter{ $0 % 2 != 0 }
//print(evenNumbers) // [4, 6, 8, 10]


let evenNumer = mappedNumbers.map{ $0 + 3 }.filter{ $0 % 2 == 0 }





print(evenNumer)

//let number = ["1", "2", "three", "/4/", "5"]
//
//// map : 클로저를 사용하여 배열의 모든 원소를 접근하여 Int()로 형변환을 한다
//// 주의 : nil의 값이 나올 수 있기 때문에 [Int?] 형으로 선언 한 것
//let mappedNumber: [Int?] = number.map{ str in Int(str) }
//// 변환이 되지 않는 놈은 nil로 반환이 된다.
//// [1, 2, nil, nil, 5]
//
//// 기존의 flatMap을 사용하여 배열의 nil 값을 걸러 내어 출력한다.
//let flatNumber: [Int] = number.flatMap{ str in Int(str) }
//// [1, ,2 ,5]=



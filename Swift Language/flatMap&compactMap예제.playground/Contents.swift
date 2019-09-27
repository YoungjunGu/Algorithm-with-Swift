import Foundation

let company: [String?] = ["NAVER", nil, "Samsung", "Kakao", nil, nil, "google"]

let valid = company.flatMap { $0 }

print(valid)


let scores = [[3,6,7], [5,8], [9,1,13]]
let allScores = scores.flatMap { $0 }
//[3, 6, 7, 5, 8, 9, 1, 13]

let passMarks = scores.flatMap { $0.filter { $0 > 7} }
// [8, 9, 13]

let input: Int? = Int("8")
let numbers: Int? = input.flatMap { $0 > 5 ? $0 : nil }

print(numbers)



//
//  main.swift
//  Codable
//
//  Created by youngjun goo on 2019/10/15.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

//struct Person: Codable {
//  var name: String
//  var age: Int
//}
//
//// JSONEncoer 객체 생성
//let encoder = JSONEncoder()
//// encoder.outputFormatting = .prettyPrinted
//// Encoding 할 구조체 타입 인스턴스 생성
//let gaki = Person(name: "Gaki", age: 25)
//
//let jsonData = try? encoder.encode(gaki)
//
//
//if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
//    print(jsonString)
//}
//
//let decoder = JSONDecoder()
//
//var data = jsonString.data(using: .utf8)
//
//if let data = data, let myPerson = try? decoder.decode(Person.self, from: data) {
//  print(myPerson.name) // Gaki
//  print(myPerson.age) // 25
//}

// no type JSON parsing
//let noTypeData: [String] = ["name: gaki", "iOS Developer"]
//
//let encoder = JSONEncoder()
//
//let jsonData = try? encoder.encode(noTypeData)
//
//
//if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
//    print(jsonString)
//}


struct Person: Codable {
    var name: String
    var age: Int
    var birthDay: Float
    var isKorean: Bool
    var job: String
    
    init(from decoder: Decoder) throws {
        var unkeyedContainer = try decoder.unkeyedContainer()
        name = try unkeyedContainer.decode(String.self)
        age = try unkeyedContainer.decode(Int.self)
        birthDay = try unkeyedContainer.decode(Float.self)
        job = try unkeyedContainer.decode(String.self)
        isKorean = try unkeyedContainer.decode(Bool.self)
    }
}


let jsonString = """
["gaki", 25, 1515083815000.0, "iOS Developer", true]
"""


let decoder = JSONDecoder()

var data = jsonString.data(using: .utf8)

if let data = data, let myPerson = try? decoder.decode(Person.self, from: data) {
    print(myPerson)
}



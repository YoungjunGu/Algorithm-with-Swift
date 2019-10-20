import UIKit


var basicDic = [String: Bool]()

basicDic["Gaki"] = true    // String, bool 모두 Hashable 을 준수하는 기본 타입

struct CustomType: Hashable {
    var property: Int
}

var customDic = [CustomType: String]()  // 위에 CustomType 구조체 선언시 Hashable 프로토콜을 준수하게 선언했기때문에 딕셔너리 키값으로 사용할 수 있다.


//struct GridPoint: Hashable {
//    var x: Int
//    var y: Int
//}
//
//let grid1 = GridPoint(x: 3, y: 3)
//let grid2 = GridPoint(x: 3, y: 3)
//
//print(grid1.hashValue == grid2.hashValue)       // true


struct GridPoint {
    var x: Int
    var y: Int
}

extension GridPoint: Hashable {
    var hashValue: Int {
        return x.hashValue ^ y.hashValue &* 16777619
    }
    
    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

class Country {
    let name: String
    let capital: String
    var visited: Bool
    
    init(name: String, capital: String, visited: Bool) {
        self.name = name
        self.capital = capital
        self.visited = visited
    }
}

extension Country: Equatable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name &&
            lhs.capital == rhs.capital &&
            lhs.visited == rhs.visited
    }
}

extension Country: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name.djb2hash )
        hasher.combine(capital.hashValue)
        hasher.combine(visited.hashValue)
    }
}


//extension Country: Hashable {
//  var hashValue: Int {
//    return name.djb2hash ^ capital.hashValue ^ visited.hashValue
//  }
//}

extension String {
    var djb2hash: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
    
    var sdbmhash: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(0) {
            Int($1) &+ ($0 << 6) &+ ($0 << 16) - $0
        }
    }
}



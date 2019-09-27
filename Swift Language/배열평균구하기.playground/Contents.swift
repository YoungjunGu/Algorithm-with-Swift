import Foundation

func average(_ arr:[Int]) -> Double {
    let total = arr.reduce(0) {
        return ($0 + $1)
    }
    return Double(total / arr.count)
}



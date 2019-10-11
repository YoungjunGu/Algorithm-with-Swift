import UIKit


var value: Int? = 2
value.map{ $0 + 3 } // Optional(5)
value = nil
value.map{ $0 + 3 } // nil == Optional.none


extension Optional {
    func optionalMap<U>(f: (Wrapped) -> U) -> U? {
        switch self {
        case .some(let x): return f(x)
        case .none: return .none
        }
    }
}


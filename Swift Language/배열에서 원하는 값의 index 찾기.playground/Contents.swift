import Foundation

func findIndexInArrat(_ array:[String], _ search: String) -> Int {

    guard let location = array.firstIndex(of: search) else {
        return -1
    }

    return location
}

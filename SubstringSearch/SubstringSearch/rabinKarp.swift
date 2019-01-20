//
//  rabinKarp.swift
//  SubstringSearch
//
//  Created by youngjun goo on 20/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

public func rabinKarp(search pattern: String, in text: String, modulo: Int, base: Int) {
    //입력 받은 문자열을 String 형으로 변환 하여 새로운 콜렉션(배열)
    let patterArray = pattern.map { String($0) }
    let textArray = text.map { String($0) }
    
    let n = textArray.count
    let m = patterArray.count
    let h = Int(pow(Double(base), Double(m - 1 ))) % modulo
    var patternModulo = 0
    var lastTextModulo = 0
    
    for i in 0...(m - 1) {
        guard let nextPatternDigit = Int(patterArray[i]), let nextTextDigit = Int(textArray[i]) else {
            print("Error")
            return
        }
        patternModulo = (base * patternModulo + nextPatternDigit) % modulo
        lastTextModulo = (base * lastTextModulo + nextTextDigit) % modulo
    }
    
    // 동등 여부를 확인하고, 다음 자릿수의 modulo를 계산한다.
    for s in 0 ... (n - m - 1) {
        // 패턴 모듈로를 이용해서 마지막 modulo를 계산한다.
        if patternModulo == lastTextModulo {
            // 동등한 모듈로를 찾았다. 이제 이들 숫자 조합의 모든 자릿수도 같은지 확인한다.
            // 자릿수가 일부 달라도 모듈로는 같을 수 있으므로 확인 작업이 필요하다.
            let substringToMatch = textArray[s ... (s + m - 1)].joined(separator: "")
            if pattern == substringToMatch {
                print("Pattern occurs at shift: \(s)")
            } else {
                print("Same modulo but no same pattern: \(s)")
            }
        }
        
        // 다음 숫자 그룹의 모듈로를 계산한다.
        if s < n - m {
            guard let highOrderDigit = Int(textArray[s]),
                let lowOrderDigit = Int(textArray[s + m]) else {
                    print("Error")
                    return
            }
            // 다음 모듈로를 계산하려면 숫자 그룹 왼쪽에 위치한 높은 단위의
            // 모듈로를 빼고, 다음 단계에서 낮은 단위의 모듈로를 더한다.
            
            // 높은 단위 자릿수의 모듈로를 뺀다.
            var substractedHighOrderDigit = (base * (lastTextModulo - highOrderDigit * h)) % modulo
            if substractedHighOrderDigit < 0 {
                // 모듈로가 음수인 경우, 이를 양수로 바꾼다.
                substractedHighOrderDigit = substractedHighOrderDigit + modulo
            }
            
            // 새로운 낮은 단위 자릿수를 더한다.
            var next = (substractedHighOrderDigit + lowOrderDigit) % modulo
            if next < 0 {
                // 모듈로가 음수인 경우, 이를 양수로 바꾼다.
                next = next + modulo
            }
            lastTextModulo = next
        }
    }
}


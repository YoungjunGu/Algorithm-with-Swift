//
//  main.swift
//  Programmers_가장긴팰린드롬
//
//  Created by youngjun goo on 24/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Int {
    let arr:[Character] = []+s;
    if(arr.count<2) {return arr.count;}
    var max = 1;
    for i in 1..<arr.count {
        if i != arr.count-1 && arr[i-1] == arr[i+1] {
            var distance = 2;
            while i-distance > -1 && i+distance < arr.count {
                if arr[i-distance] != arr[i+distance] {
                    break;
                }
                distance += 1;
            }
            distance -= 1;
            if distance*2+1 > max {
                max = distance*2 + 1;
            }
        }
        if arr[i-1] == arr[i] {
            var distance = 1;
            while i-distance-1 > -1 && i+distance < arr.count {
                if arr[i-distance-1] != arr[i+distance] {
                    break;
                }
                distance += 1;
            }
            distance -= 1;
            if distance*2+2 > max {
                max = distance*2+2;
            }
        }
    }
    return max;
}


let s = "abacde"

print(solution(s))

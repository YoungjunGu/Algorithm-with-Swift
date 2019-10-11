//
//  ShortCode.swift
//  Programmers_올바른괄호
//
//  Created by youngjun goo on 2019/10/11.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution2(_ s:String) -> Bool
{
    var ans:Bool = false

    var openCnt: Int = 0, closeCnt: Int = 0

    for ch in s {
        switch ch {
        case "(":
            openCnt += 1
        case ")":
            closeCnt += 1
        default:
            break
        }

        guard openCnt >= closeCnt else {
            break
        }
    }

    ans = openCnt == closeCnt

    return ans
}

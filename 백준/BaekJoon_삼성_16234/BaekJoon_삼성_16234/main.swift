//
//  main.swift
//  BaekJoon_삼성_16234
//
//  Created by youngjun goo on 28/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var N: Int = 0
var L: Int = 0
var R: Int = 0

//동 서
var dirX = [0, 0, 1, -1]
//남 북
var dirY = [-1, 1, 0, 0]




print("test")

func unitedPopulation(country x: Int, population y: Int) -> Int {
    let unitedCnt: Int = Int(round(Double(y/x)))
    
    return unitedCnt
}


func solving() -> Int {
    var ans: Int = 0
    //총 인구 수
    var total = 0
    //해당 나라 수
    var country = 0
    var unitedCnt = 0
    var matrix = inputString()
    var mark = [[Int]](repeating: Array(repeating: 0, count: N), count: N)
    
    while true {
        var check = true
        for i in 0..<N {
            for j in 0..<N {
                for k in 0..<4 {
                    let nextX = i + dirX[k]
                    let nextY = j + dirY[k]
                    
                    if 0 <= nextX && nextX < N && 0 <= nextY && nextY < N {
                        let dif = abs(matrix[nextX][nextY] - matrix[i][j])
                        //print(dif)
                        //차의 값이 안에 속하면 해당 mark를 변경
                        if dif >= L && dif <= R {
                            mark[i][j] = 1
                            mark[nextX][nextY] = 1
                        }
                    }
                }
            }
        }
        
        for i in 0..<N {
            for j in 0..<N {
                //1이 발견 되었다는 건 연합국 이라는 소리 -> DFS를 통해 해당 나라와 연관된 모든 나라들을 찾아내어 연합국 인구수로 바꿔줘야한다.
                if mark[i][j] == 1 {
                    check = false
                    total += matrix[i][j]
                    country += 1
                }
            }
        }
        //false == 연합국이 존재 하므로 해당 통합을 실행
        if check == false {
         
            unitedCnt = unitedPopulation(country: country, population: total)
        
            for i in 0..<N {
                for j in 0..<N {
                    if mark[i][j] == 1 {
                        matrix[i][j] = Int(unitedCnt)
                    }
                    mark[i][j] = 0
                }
            }
            country = 0
            total = 0
            check = true
            ans += 1
        } else {
            break
        }

    }
    
    return ans
}



func inputString() -> [[Int]] {
    let firstRead = readLine()
    let firstString = firstRead?.components(separatedBy: " ")
    
    var matrix = [[Int]](repeating: Array(repeating: 0, count: 50), count: 50)
    
    N = Int(firstString![0])!
    L = Int(firstString![1])!
    R = Int(firstString![2])!
    
    for i in 0..<N {
        let readByLine = readLine()
        let lineString = readByLine?.components(separatedBy: " ")
        for j in 0..<N {
            matrix[i][j] = Int(lineString![j])!
        }
        
    }
    return matrix
}



print(solving())

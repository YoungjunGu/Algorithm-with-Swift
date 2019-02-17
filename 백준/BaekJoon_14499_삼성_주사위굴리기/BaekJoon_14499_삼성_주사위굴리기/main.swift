//
//  main.swift
//  BaekJoon_14499_삼성_주사위굴리기
//
//  Created by youngjun goo on 17/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

var matrix = [[Int]](repeating: Array(repeating: 0, count: 20), count: 20)
var dice: [Int] = [0, 0, 0, 0, 0, 0, 0]
var dx: [Int] = [0, 0, -1, 1]
var dy: [Int] = [1, -1, 0, 0]
var x: Int = 0
var y: Int = 0
var n: Int = 0
var m: Int = 0
var cnt: Int = 0

//클로저를 활용 할 수 있을까?
func safeZoneCheck(x: Int, y: Int) -> Bool {
    if x >= 0 && x < n && y >= 0 && y < m {
        return true
    } else {
        return false
    }
}


func rollingDice() {
    let read = readLine()
    let initString = read?.components(separatedBy: " ")
    n = Int(initString![0])!
    m = Int(initString![1])!
    x = Int(initString![2])!
    y = Int(initString![3])!
    cnt = Int(initString![4])!
    
    for i in 0..<n {
        let read = readLine()
        let initString = read?.components(separatedBy: " ")
        for j in 0..<m {
            matrix[i][j] = Int(initString![j])!
        }
    }
    //주사위 명령을 수행
    let readOper = readLine()
    let operList = readOper?.components(separatedBy: " ")
    
    for i in 0..<cnt {
        var oper = Int(operList![i])!
        oper -= 1
        let nextX = x + dx[oper]
        let nextY = y + dy[oper]
        
        if safeZoneCheck(x: nextX, y: nextY) {
            var nDice = dice.map({ (value: Int) -> Int in return Int(value) })
            if oper==0 {
                nDice[3]=dice[1];
                nDice[1]=dice[4];
                nDice[4]=dice[6];
                nDice[6]=dice[3];
                nDice[2]=dice[2];
                nDice[5]=dice[5];
            }
            if oper==1 {
                nDice[1]=dice[3];
                nDice[3]=dice[6];
                nDice[6]=dice[4];
                nDice[4]=dice[1];
                nDice[2]=dice[2];
                nDice[5]=dice[5];
            }
            if oper==2 {
                nDice[1]=dice[5];
                nDice[5]=dice[6];
                nDice[6]=dice[2];
                nDice[2]=dice[1];
                nDice[3]=dice[3];
                nDice[4]=dice[4];
            }
            if oper==3 {
                nDice[1]=dice[2];
                nDice[2]=dice[6];
                nDice[6]=dice[5];
                nDice[5]=dice[1];
                nDice[3]=dice[3];
                nDice[4]=dice[4];
            }
            if matrix[nextX][nextY]==0 {
                matrix[nextX][nextY]=nDice[6];
            } else {
                nDice[6]=matrix[nextX][nextY];
                matrix[nextX][nextY]=0;
            }
            print(nDice[1])
            for i in 0..<7 {
                dice[i] = nDice[i]
            }
            x = nextX
            y = nextY
            
        }

    }
    
}

rollingDice()


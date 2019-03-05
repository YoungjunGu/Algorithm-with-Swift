//
//  main.swift
//  BaekJoon_삼성_16234
//
//  Created by youngjun goo on 28/02/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


//Array를 이용한 Stack
public struct ArrayStack<T> {
    //소속 소스파일 내에 접근해야 하기 때문에 접근자 : fileprivate
    //stackArray는 다양한 자료형을 담아야 하기 때문에 제네릭 사용 필수
    fileprivate var elements = [T]()
    
    public init() {}
    
    mutating public func pop() -> T? {
        return self.elements.popLast()
    }
    mutating public func push(element: T) {
        self.elements.append(element)
    }
    //Stack의 정점을 추가
    //last는 배열의 마지막을 반환 한다.
    public func peek() -> T? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    public var count: Int {
        return self.elements.count
    }
    
}

struct Index {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

var N: Int = 0
var L: Int = 0
var R: Int = 0

//동 서
var dirX = [0, 0, 1, -1]
//남 북
var dirY = [-1, 1, 0, 0]

var stack = ArrayStack<Index>()


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

//지도 정보 입력

print("16234")
var matrix = inputString()
var mark = [[Int]](repeating: Array(repeating: 0, count: N), count: N)

print("데이터 입력 완료")


func unitedPopulation(country x: Int, population y: Int) -> Int {
    let unitedCnt: Int = Int(round(Double(y/x)))
    
    return unitedCnt
}

func dfs(x: Int, y: Int) {
    
    stack.push(element: Index(x: x, y: y))
    mark[x][y] = 0
    
    for i in 0..<4 {
        let nextX = i + dirX[i]
        let nextY = i + dirY[i]
        
        if 0 <= nextX && nextX < N && 0 <= nextY && nextY < N && mark[nextX][nextY] == 1 {
            stack.push(element: Index(x: nextX, y: nextY))
            mark[nextX][nextY] = 0
            dfs(x: nextX, y: nextY)
        }
    }
    
}

func unitedCountry() {
    
    var totalPop: Int = 0
    let countryCnt: Int = stack.count
    var avgPop: Int = 0
    
    for index in stack.elements {
        
        totalPop += matrix[index.x][index.y]
    }
    //해당 국가의 평균을 구하고
    avgPop = Int(round(Double(totalPop/countryCnt)))
    print(avgPop)
    
    //해당 국가의 인구수를 평균으로 바꾼다.
    for _ in 0..<countryCnt {
        let index = stack.pop()
        
        matrix[index!.x][index!.y] = avgPop
    }
    
    
    
}

func solving() -> Int {
    var ans: Int = 0
    //총 인구 수
    
    print("진입")
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
                            check = false
                            mark[i][j] = 1
                            mark[nextX][nextY] = 1
                        }
                    }
                }
            }
        }
        
        print(check)
        for i in 0..<N {
            for j in 0..<N {
                //1이 발견 되었다는 건 연합국 이라는 소리 -> DFS를 통해 해당 나라와 연관된 모든 나라들을 찾아내어 연합국 인구수로 바꿔줘야한다.
                if mark[i][j] == 1 {
                    dfs(x: i, y: j)
                    unitedCountry()
                }
            }
        }
        //false == 연합국이 존재 하므로 해당 통합을 실행
        if check == false {
            check = true
            ans += 1
        } else {
            break
        }

    }
    
    return ans
}



print(solving())

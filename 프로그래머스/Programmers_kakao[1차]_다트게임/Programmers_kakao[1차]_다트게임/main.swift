//
//  main.swift
//  Programmers_kakao[1차]_다트게임
//
//  Created by youngjun goo on 27/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

typealias Score = (point : Int, option : Character?)

func getPoint(score : Score, s : String) -> Int{
  let point = 10 * score.point + Int(s)!
  return point
}

func getBonus(score: Score, s : String) -> Int{
  var bonus = 0

  switch s {
  case "S":
    bonus = score.point
  case "D":
    bonus = Int(pow(Double(score.point), 2))
  case "T":
    bonus = Int(pow(Double(score.point), 3))
  default:
    bonus = score.point
  }

  return bonus
}

func solution(_ dartResult:String) -> Int {
    var scoreList = [Score]()

    scoreList.append((0, nil))
    var i = 0
    var isPointStarted = true

    for r in dartResult{
      switch r{
      case "0"..."9":
        if !isPointStarted{
          i += 1
          scoreList.append((0,nil))
        }
        isPointStarted = true
        scoreList[i].point = getPoint(score: scoreList[i], s: String(r))
      case "S":
        isPointStarted = false
        scoreList[i].point = scoreList[i].point
      case "D":
        isPointStarted = false
        scoreList[i].point = Int(pow(Double(scoreList[i].point), 2))
      case "T":
        isPointStarted = false
        scoreList[i].point = Int(pow(Double(scoreList[i].point), 3))
      case "*":
        scoreList[i].point *= 2
        if i > 0 { scoreList[i-1].point *= 2 }
      case "#":
        scoreList[i].point = -scoreList[i].point
      default: print(r)
      }
    }

    var sum = 0
    for (s, _) in scoreList{
      sum += s
    }

    return sum
}

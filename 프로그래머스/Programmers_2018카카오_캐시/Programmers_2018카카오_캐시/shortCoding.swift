//
//  shortCoding.swift
//  Programmers_2018카카오_캐시
//
//  Created by youngjun goo on 2019/11/04.
//  Copyright © 2019 youngjun goo. All rights reserved.
//


import Foundation

func LRU(ch : [String], city : String, cacheSize : Int) -> [String]{
    var cache = ch
    // 해당 도시가 포함이 된다 즉 hit이 되면 해당 도시를 캐시에서 우선 지우고
    if cache.contains(city){ cache.remove(at: cache.firstIndex(of: city)!) }
    // 현재 캐시가 full 이면 가장 마지막을 지운다.
    if cache.count == cacheSize{ cache.removeLast() }
    // 그리고 새롭게 들어오는 도시를 맨앞에 삽입 한다.
    cache.insert(city, at: 0)
    
    return cache
}

func solution2(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var count = 0
    
    if cacheSize == 0 { return 5*cities.count }
    else{
        for city in cities{
            let lowedCity = city.lowercased()
            if cache.contains(lowedCity){ count += 1 }
            else{ count += 5 }
            cache = LRU(ch: cache, city: lowedCity, cacheSize: cacheSize)
        }
    }
    
    return count
}


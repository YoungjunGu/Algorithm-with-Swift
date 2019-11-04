//
//  main.swift
//  Programmers_2018카카오_캐시
//
//  Created by youngjun goo on 2019/11/04.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var time: Int = 0
    var cache: [Cache] = []
    var curIndex: Int = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    cities.forEach { (city) in
        // 초기 miss
        if curIndex < cacheSize {
            cache.append(Cache(city: city, flag: curIndex + 1))
            time += 5
        } else {
            var hit: Bool = false
            var index: Int = 0
            for i in 0..<cacheSize {
                if cache[i].city.lowercased() == city.lowercased() {
                    hit = true
                    index = i
                }
            }
            // hit 되면
            if hit {
                cache[index].flag = curIndex + 1
                time += 1
            } else {
                let replaceIndex = getCacheReplaceIndex(cacheSize, cache: cache)
                cache[replaceIndex].city = city
                cache[replaceIndex].flag = curIndex + 1
                time += 5
            }
        }
        curIndex += 1
    }
    print(cache)
    return time
}

func getCacheReplaceIndex(_ cacheSize: Int, cache: [Cache]) -> Int {
    var index = 0
    var min = 987654321
    for i in 0..<cacheSize {
        if cache[i].flag < min {
            min = cache[i].flag
            index = i
        }
    }
    
    return index
}


struct Cache {
    var city: String
    var flag: Int
    
    init(city: String, flag: Int) {
        self.city = city
        self.flag = flag
    }
}

let cities16 = ["Jeju", "Pangyo", "NewYork", "newyork", "tokyo"]
let cities52 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
let cities = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
let cacheSize = 2

print(solution(cacheSize, cities16))



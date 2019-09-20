//
//  Queue.swift
//  Queue
//
//  Created by youngjun goo on 20/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


public struct Queue2<T> {
    fileprivate var array = [T]() //제네릭 타입의 배열 생성
    
    public var front: T? { return array.first } // Queue의 맨 앞 부분은 first , 반환 타입은 
    public var count:
}

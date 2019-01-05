//
//  TreeClass.swift
//  RedBlackTree
//
//  Created by youngjun goo on 05/01/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation

//각 노드의 Red Black Color를 적용 시키기 위해 열거형 구조체 선언
public enum RedBlackTreeColor: Int {
    case red = 0
    case black = 1
}

//레드블랙 트리를 구성할 클래스 선언
//필수 속성값 1.값 ,2.왼쪽 오른 쪽 자식 3.부모 노드 4.색깔정보
public class RedBlackTreeNode<T: Comparable> {
    // 데이터 값 자식 부모 변수
    public var data: T
    public var rightChild: RedBlackTreeNode?
    public var leftChild: RedBlackTreeNode?
    public weak var parent: RedBlackTreeNode?
    //컬러 변수
    public var color: RedBlackTreeColor
    //이니셜라이저
    
    public init(data: T, left: RedBlackTreeNode?, right: RedBlackTreeNode?, parent: RedBlackTreeNode?,
                color: RedBlackTreeColor) {
        self.data = data
        self.rightChild = right
        self.leftChild = left
        self.parent = parent
        self.color = color
    }
    //초기값 설정을 위해 보조 이니셜러이저 를 설정 초기값은 부모 자식이 nil 이고 색상이 검은색
    public convenience init(data: T) {
        self.init(data: data, left: nil, right: nil, parent: nil, color: RedBlackTreeColor.black)
    }

}
//MARK: Method
extension RedBlackTreeNode {
    //해당 노드의 할아버지 반환 없을 시 nil(black)
    public func grandParentNode() -> RedBlackTreeNode? {
        guard let grandParentNode = self.parent?.parent else {
            return nil
        }
        return grandParentNode
    }
    //삼촌 노드를 반환 즉 부모의 형제
    public func uncleNode() -> RedBlackTreeNode? {
        guard let grandParent = self.grandParentNode() else {
            return nil
        }
        //노드의 부모 형제 즉 삼촌을 반환 한다.
        if parent === grandParent.leftChild {
            return grandParent.rightChild
        } else {
            return grandParent.leftChild
        }
    }
    
    public static func printTree(nodes: [RedBlackTreeNode]) {
        var children: [RedBlackTreeNode] = Array()
        for node: RedBlackTreeNode in nodes {
            print("\(node.data)" + " " + "\(node.color)")
            if let leftChild = node.leftChild {
                children.append(leftChild)
            }
            if let rightCild = node.rightChild {
                children.append(rightCild)
            }
        }
        if children.count > 0 {
            printTree(nodes: children)
        }
    }
    //회전
    //레드블랙 트리의 노드가 이동할때  컬러 조건을 유지할 수 있는 방법
    //우측 회전
    public func rotateRight() {
        guard let parent = parent else {
            return
        }
        let grand
        
    }

}

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
        //1.조부 설정 새로운 오른쪽 자식, 왼쪽 자식 판단 프로퍼티
        let grandParent = parent.parent
        let newRightChildsLeftChild = self.rightChild
        var wasLeftChild = false
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        //2.기존의 부모가 왼쪽 자식이 된다.
        self.leftChild = parent
        self.leftChild?.parent = self
        
        //3.기존의 조부 노드가 새로운 부모 노드가 됨
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        //4.기존의 좌측 자식 요소는 새로운 좌측 자식의 우측 자식 노드가 된다.
        self.leftChild?.rightChild = newRightChildsLeftChild
        self.leftChild?.rightChild?.parent = self.leftChild
        
    }
    //좌측 회전
    public func rotateLeft() {
        guard let parent = parent else {
            return
        }
        
        let grandParent = parent.parent
        let newLeftChildsRightChild = self.leftChild
        var wasLeftChild = false
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        
        self.rightChild = parent
        self.rightChild?.parent = self
        
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        
        leftChild?.rightChild = newLeftChildsRightChild
        leftChild?.rightChild?.parent = leftChild
    }
}

//MARK: -삽입
extension RedBlackTreeNode {
    
    //주의: 이진탐색의 속성을 유지해야한다.
    public func insertNodeFromRoot(data: T) {
        //root node 를 찾기 위함
        if let _ = parent {
            return
        }
        insertNode(data: data)
    }
    
    private func insertNode(data: T) {
        if data < self.data {
            if let leftChild = leftChild {
                leftChild.insertNode(data: data)
            } else {
                let newNode = RedBlackTreeNode(data: data)
                newNode.parent = self
                newNode.color = .red
                leftChild = newNode
                
                insertionReviewStep1(node: newNode)
            }
        } else {
            if let rightChild = rightChild {
                rightChild.insertNode(data: data)
            } else {
                let newNode = RedBlackTreeNode(data: data)
                newNode.parent = self
                newNode.color = .red
                leftChild = newNode
                insertionReviewStep1(node: newNode)
            }
        }
    }
    
    private func insertionReviewStep1(node: RedBlackTreeNode) {
        if let _ = node.parent {
            insertionReviewStep2(node: node)
        } else {
            node.color = .black
        }
    }
    
    private func insertionReviewStep2(node: RedBlackTreeNode) {
        if node.parent?.color == .black {
            return
        }
        insertionReviewStep3(node: node)
    }
    
    private func insertionReviewStep3(node: RedBlackTreeNode) {
        if let uncle = node.uncleNode() {
            if uncle.color == .red {
                node.parent?.color = .black
                uncle.color = .black
                if let grandParent = node.grandParentNode() {
                    grandParent.color = .red
                    insertionReviewStep1(node: grandParent)
                }
                return
            }
        }
        insertionReviewStep4(node: node)
    }
    
    private func insertionReviewStep4(node: RedBlackTreeNode) {
        var node = node
        guard let grandParent = node.grandParentNode() else {
            return
        }
        if node === node.parent?.rightChild && node.parent === grandParent.leftChild {
            node.parent?.rotateLeft()
            node = node.leftChild!
        } else if node === node.parent?.leftChild && node.parent === grandParent.rightChild {
            node.parent?.rotateRight()
            node = node.rightChild!
        }
        insertionReviewStep5(node: node)
    }
    
    private func insertionReviewStep5(node: RedBlackTreeNode) {
        guard let grandParent = node.grandParentNode() else {
            return
        }
        node.parent?.color = .black
        grandParent.color = .red
        if node === node.parent?.leftChild {
            grandParent.rotateRight()
        } else {
            grandParent.rotateLeft()
        }
    }
}

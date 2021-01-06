//
//  main.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/06.
//

import Foundation

print("Hello, World!")

public func testFunction() -> Int{
    return 10
}

var c1 = Card(figure: .heart, num: 12)
var c2 = Card(figure: .spade, num: 7)
var c3 = Card(figure: .joker, num: 13)

print(c1.description())
print(c2.description())
print(c3.description())

//
//  Card.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/06.
//

import Foundation

public class Card {
    // 포커에서의 모양은 4개가 있는데, 유니코드를 직접 쓰기엔 복잡하므로 enum을 활용하여 raw type을 String으로 선언하였다. char가 아니라 string인 이유는 정보를 출력할 때 편하게 문자열로 합치기 위해서이다.
    // 조커를 넣어주기 위해 조커도 Figure에 추가해 주었다.
    enum Figure : String {
        case heart = "❤️", clover = "🍀", spade = "♠", diamond = "♦", joker = "🃏"
    }
    
    // 모양은 enum 타입인 Figure로 선언하였다.
    private let figure : Figure
    // 숫자는 1~13중에 하나 이므로 편하게 정수로 선언하였다.
    private let num : Int
    
    
    init(figure : Figure, num : Int) {
        self.figure = figure
        self.num = num
    }
    
    // int to char 메소드를 통해 숫자를 출력할 문자열로 바꾼다
    func itos(num : Int) -> String {
        switch num {
        case 1..<10:
            return String(num)
        case 10:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return ""
        }
    }
    
    func description() -> String {
        if self.figure.rawValue == "🃏" {
            return "🃏"
        }
        else {
            return self.figure.rawValue + self.itos(num: self.num)
        }
    }
}

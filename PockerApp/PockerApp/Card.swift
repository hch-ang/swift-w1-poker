//
//  Card.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/06.
//

import Foundation

public class Card {
    enum Figure : String {
        case heart = "❤️", clover = "🍀", spade = "♠", diamond = "♦", joker = "🃏"
    }
    
    // 모양은 enum 타입인 Figure로 선언하였다.
    let figure : Figure
    // 숫자는 1~13중에 하나 이므로 편하게 정수로 선언하였다.
    let num : Int
    
    
    init(figure : Figure, num : Int) {
        self.figure = figure
        self.num = num
    }
    
    // int to char 메소드를 통해 숫자를 출력할 문자열로 바꾼다
    func itos(num : Int) -> String {
        switch num {
        case 2...10:
            return String(num)
        case 1:
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

//
//  CardDeck.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/06.
//

import Foundation

public class CardDeck {
    
    private var cards : [Card] = []
    
    init() {
        reset()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func shuffle() {
        // using Fisher-Yates Algorithm
        let len = cards.count
        for i in stride(from: len-1, to: 0, by: -1) {
            let j = Int.random(in: 0...i)
            let tempcard = cards[i]
            cards[i] = cards[j]
            cards[j] = tempcard
        }
        return
    }
    
    func removeOne() -> Card? {
        return cards.popLast() ?? nil
    }
    
    func reset() {
        cards = []
        for num in 1...13 {
            cards.append(Card(figure: .clover, num: num))
            cards.append(Card(figure: .diamond, num: num))
            cards.append(Card(figure: .heart, num: num))
            cards.append(Card(figure: .spade, num: num))
        }
        cards.append(Card(figure: .joker, num: 100))
    }
    
}


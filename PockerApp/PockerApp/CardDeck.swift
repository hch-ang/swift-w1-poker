//
//  CardDeck.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/06.
//

import Foundation

class CardDeck {
    
    private var cards : [Card]
    
    init() {
        self.cards = []
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func shuffle() {
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

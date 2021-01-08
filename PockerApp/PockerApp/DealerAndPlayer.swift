//
//  Distribution.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/08.
//

import Foundation

class Player {
    let playernum : Int
    var cards : [Card] = []

    init(playernum : Int) {
        self.playernum = playernum
    }
    
    func description() -> String{
        var desc = "참가자#\(playernum) ["
        for i in 0..<cards.count {
            desc += cards[i].description()
            if i < cards.count - 1 {
                desc += ", "
            }
        }
        desc += "]"
        return desc
    }
}

class Dealer {
    var deck : CardDeck
    var players : [Player] = []
    var cards : [Card] = []
    
    init() {
        deck = CardDeck()
    }
    
    func startGame(cardnum : Int, playernum : Int) {
        // 덱이 부족하면 경고를 출력하고 return한다.
        if deck.count() < cardnum * (playernum + 1) {
            print("we need more cards in deck.")
            print("cur : \(deck.count()) , needs : \(cardnum * (playernum + 1))")
            return
        }
        
        // 덱이 부족하지 않으면 플레이어를 초기화하고 카드를 나누어 준다.
        // 카드를 나누어 주기 전에 한번 섞는다.
        deck.shuffle()
        // 일단 딜러가 먼저 카드를 갖는다
        cards.removeAll()
        for _ in 0..<cardnum {
            let card = deck.removeOne()!
            cards.append(card)
        }
        //플레이어들을 초기화하고 한 명씩 카드를 나누어 준다.
        players.removeAll()
        for i in 0..<playernum {
            players.append(Player(playernum : i))
            for _ in 0..<cardnum {
                let card = deck.removeOne()!
                players[i].cards.append(card)
            }
        }
    }
    
    func description() -> String {
        var desc = "딜러 ["
        for i in 0..<cards.count {
            desc += cards[i].description()
            if i < cards.count - 1 {
                desc += ", "
            }
        }
        desc += "]"
        return desc
    }
    
    func resetDeck() {
        deck.reset()
    }
}


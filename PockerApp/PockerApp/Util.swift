//
//  Util.swift
//  PockerApp
//
//  Created by Hochang Lee on 2021/01/08.
//

import Foundation

class Calculator {
    
    class func calcPoint(cards : [Card]) -> Int {
        var hasJoker = false
        var board = [Int](repeating: 0, count: 14)
        var maxfig = [Int](repeating: 0, count: 14)
        for card in cards {
            if card.figure == .joker {
                hasJoker = true
                continue
            }
            board[card.num] = board[card.num] + 1
            maxfig[card.num] = compFig(num: maxfig[card.num], figure: card.figure)
        }
        
        // 조커 : -1
        // 스페이드 : 1 다이아 : 2 하트 : 3 클로버 : 4
        // 그냥 숫자 : 10 ~ 130
        // 원페어 : 1000~13000
        // 투페어 : 100000 ~ 16900000
        // 트리플 : 100000000 ~ 1300000000
        // 스트레이트 : 10000000000 ~ 130000000000
        // 포카드 : 1000000000000 ~ 13000000000000

        // 포카드
        for num in 1...13 {
            if board[num] == 4 {
                return num * 1000000000000
            }
        }
        
        // 스트레이트
        var seq = 0
        for num in stride(from: 13, to: 0, by: -1) {
            if board[num] == 0 {
                if hasJoker && seq == 4 {
                    return num * 10000000000 - 1
                }
                seq = 0
            } else {
                seq = seq + 1
                if seq == 5 {
                    return (num + 4)*10000000000 + maxfig[num + 4]
                }
            }
        }
        
        // 트리플
        for num in 1...13 {
            if board[num] == 3 {
                if hasJoker {
                    return num * 1000000000000 - 1
                } else {
                    return num * 100000000 + maxfig[num]
                }
            }
        }
        
        // 페어
        var pairs = [Int]()
        for num in 1...13 {
            if board[num] == 2 {
                pairs.append(num)
            }
        }
        if hasJoker && pairs.count > 0 {
            let retnum = pairs.last ?? 0
            return retnum * 100000000 + maxfig[retnum] - 1
        }
        if pairs.count > 1 {
            var retnum = pairs.popLast() ?? 0
            let figpoint = maxfig[retnum]
            retnum += pairs.popLast() ?? 0
            return retnum * 100000 + figpoint
        } else if pairs.count == 1 {
            let retnum = pairs.popLast() ?? 0
            if hasJoker {
                return retnum * 1000 - 1
            }
            return retnum * 1000 + maxfig[retnum]
        }
        
        // 페어도 없지만 조커가 있을 경우
        if hasJoker {
            for num in stride(from: 13, to: 0, by: -1) {
                if board[num] > 0 {
                    return num * 1000 - 1
                }
            }
        }
        
        for num in stride(from: 13, to: 0, by: -1) {
            if board[num] > 0 {
                return num * 10 + maxfig[num]
            }
        }
        
        return 1
    }
    
    //class func
    class func compFig(num : Int, figure : Card.Figure) -> Int {
        switch figure {
        case .spade :
            return 4
        case .diamond :
            return num > 3 ? num : 3
        case .heart :
            return num > 2 ? num : 2
        case .clover :
            return num > 1 ? num : 1
        default :
            return 0
        }
    }
    
}


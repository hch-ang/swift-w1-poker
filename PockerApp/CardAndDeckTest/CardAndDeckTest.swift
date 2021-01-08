//
//  TestToolsTest.swift
//  TestToolsTest
//
//  Created by Hochang Lee on 2021/01/06.
//

import XCTest
//@testable import PockerApp

class CardAndDeckTest: XCTestCase {

    var c1 : Card?
    var c2 : Card?
    var c3 : Card?
    var deck : CardDeck?

    override func setUpWithError() throws {
        c1 = Card(figure: .heart, num: 12)
        c2 = Card(figure: .spade, num: 7)
        c3 = Card(figure: .joker, num: 13)
        deck = CardDeck()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCardCreatesWellNotNill() throws {
        XCTAssertNotNil(c1)
        XCTAssertNotNil(c2)
        XCTAssertNotNil(c3)

    }
    
    func testCardCreatesWellCorrectInfo() throws {

        XCTAssertEqual(c1!.description(), "❤️Q")
        XCTAssertEqual(c2!.description(), "♠7")
        XCTAssertEqual(c3!.description(), "🃏")
    }
    
    func testCardDeckCreateWell() throws {
        // Deck이 잘 생성되었는지 체크
        XCTAssertNotNil(deck)
    }
    
    func testCardDeckCorrectCardNumber() throws {
        // deck의 카드 숫자가 잘 초기화되었는지 체크
        XCTAssertEqual(deck!.count(), 53)
    }
        
    func testCardDeckShuffleWell() throws {
        // Shuffle 이후에도 카드 수가 동일한지 체크
        deck!.shuffle()
        XCTAssertEqual(deck!.count(), 53)
    }
    
    func testCardDeckRemoveNotNil() throws {
        // 카드를 53번 빼면서 잘 빠지는지 체크
        for _ in 0..<53 {
            XCTAssertNotNil(deck!.removeOne())
        }
    }
    
    func testCardDeckResetWell() throws {
        // 카드를 리셋한 후 개수가 모두 채워졌는지 체크
        XCTAssertNoThrow(deck!.reset())
        XCTAssertEqual(deck!.count(), 53)
    }

}

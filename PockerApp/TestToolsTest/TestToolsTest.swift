//
//  TestToolsTest.swift
//  TestToolsTest
//
//  Created by Hochang Lee on 2021/01/06.
//

import XCTest
//@testable import PockerApp

class TestToolsTest: XCTestCase {
    
    override func setUpWithError() throws {
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
    
    func testCardCreatesWell() throws {
        let c1 = Card(figure: .heart, num: 12)
        let c2 = Card(figure: .spade, num: 7)
        let c3 = Card(figure: .joker, num: 13)

        XCTAssertEqual(c1.description(), "❤️Q")
        XCTAssertEqual(c2.description(), "♠7")
        XCTAssertEqual(c3.description(), "🃏")
    }
    
    func testCardDeckCreateWell() throws {
        // Deck이 잘 생성되었는지 체크
        let cDeck = CardDeck()
        XCTAssertEqual(cDeck.count(), 53)
        
        // Shuffle 이후에도 카드 수가 동일한지 체크
        cDeck.shuffle()
        XCTAssertEqual(cDeck.count(), 53)
        
        // 카드를 53번 빼면서 잘 빠지는지 체크
        for _ in 0..<53 {
            XCTAssertNotNil(cDeck.removeOne())
        }
        
        // 카드를 53번 뺀 이후에 덱에 남아있는 카드가 없는지 체크
        XCTAssertEqual(cDeck.count(), 0)
        
        // 카드를 모두 뺀 후에 removeOne()메소드 실행 시 nil이 반환되는지 체크
        XCTAssertNil(cDeck.removeOne())
        
        // 이후에도 카드 수가 0으로 잘 유지되는지 체크
        XCTAssertEqual(cDeck.count(), 0)
        
        // 카드를 리셋한 후 개수가 모두 채워졌는지 체크
        cDeck.reset()
        XCTAssertEqual(cDeck.count(), 53)
        
    }
    

}

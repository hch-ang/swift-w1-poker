//
//  PlayerAndGameTest.swift
//  PlayerAndGameTest
//
//  Created by Hochang Lee on 2021/01/08.
//

import XCTest

class PlayerAndGameTest: XCTestCase {

    var player : Player?
    var dealer : Dealer?

    override func setUpWithError() throws {
        player = Player(playernum: 1)
        dealer = Dealer()
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
    
    
    func testDealerCreateWell() throws {
        XCTAssertNotNil(dealer)
    }
    
    func testDealerResetDeck() throws {
        dealer!.resetDeck()
        XCTAssertEqual(dealer!.deck.count(), 53)
    }
    
    func testDealerStartGame() throws {
        dealer?.distribution(cardnum: 7, playernum: 3)
        XCTAssertEqual(dealer?.cards.count, 7)
        XCTAssertEqual(dealer?.players[0].cards.count, 7)
        XCTAssertEqual(dealer?.players[1].cards.count, 7)
        XCTAssertEqual(dealer?.players[2].cards.count, 7)
    }
    
    
}

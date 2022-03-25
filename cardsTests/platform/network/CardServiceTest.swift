//
//  CardServiceTest.swift
//  cardsTests
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation
@testable import cards

class CardServiceTest: BaseCardsTest {
    
    
    func test_get_cards_service() {
        let expectation = self.expectation(description: "getCards")
        _ = stubbingProvider.request(.getCards) { res in
            // pass or fail depending on your test needs
            do {
                print("Response \(try res.get())")
            } catch {
                print(error)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
}

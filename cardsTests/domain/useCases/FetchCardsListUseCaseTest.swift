//
//  CardsListUseCaseTest.swift
//  cardsTests
//
//  Created by Sundeep Singh on 21/03/22.
//

import Foundation

@testable import cards
import XCTest
import RxBlocking

class CardsListUseCaseTest: BaseCardsTest {

    var card: Card!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        card = nil
    }
    
    func test_fetch_cards_success() throws {
        //Given
        let stubRepository = CardsRepositoryStub()
        let sut = DefaultFetchCardsListUseCase(cardsRepository: stubRepository)
        
        //When
        let initialCardList = (try sut.cardList().toBlocking(timeout: 10).first())
        let eventualCardList = (try sut.cardList().toBlocking(timeout: 10).first())
         
        //Then
        XCTAssertNotNil(initialCardList)
        XCTAssertEqual(eventualCardList?.count, 1)
        
    }
}

private let cardJson = """
{
    "card":"8723654598562487",
    "name":"Busincess Charge",
    "type": "charge",
    "image":"https://www.lloydsbank.com/assets/assets-business-banking/png/cards/businesscharge.jpg",
    "limit":3000,
    "enabled":true
}
"""

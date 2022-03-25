//
//  cardModelTests.swift
//  cardsTests
//
//  Created by Sundeep Singh on 20/03/22.
//

@testable import cards
import XCTest

class CardModelTests: BaseCardsTest {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testJsonSerialization() {
        let card = Card(number: "8723654598562487",
                        name: "Busincess Charge",
                        type: CardType.charge,
                        cardImgUrlStr: "https://www.lloydsbank.com/assets/assets-business-banking/png/cards/businesscharge.jpg",
                        limit: 3000, enabled: true)
        do {
            guard let origJSONDict = try JSONSerialization.jsonObject(with: Data(cardJson.utf8),
                                                                      options: .mutableContainers) as? [String: Any]
                else { return }

            guard let generatedJsonDict = try JSONSerialization.jsonObject(with: Data(card.json()!.utf8),
                                                                           options: .mutableContainers) as? [String: Any]
                else { return }
            XCTAssertEqual(origJSONDict == generatedJsonDict, true)
        } catch {
            print(error.localizedDescription)
        }
    }

    func testJsonDeserialization() {
        let card = Card(number: "8723654598562487",
                        name: "Busincess Charge",
                        type: CardType.charge,
                        cardImgUrlStr: "https://www.lloydsbank.com/assets/assets-business-banking/png/cards/businesscharge.jpg",
                        limit: 3000, enabled: true)
        XCTAssertEqual(card, Card(cardJson))
    }
}

extension Card: JSONTestable {}

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

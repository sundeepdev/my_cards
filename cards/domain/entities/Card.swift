//
//  cardModel.swift
//  cards
//
//  Created by Sundeep Singh on 20/03/22.
//

import Foundation

struct Card: Codable {
    var number: String
    var name: String
    var type: CardType
    var cardImgUrlStr: String
    var limit: Int
    var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case number = "card"
        case name
        case type
        case cardImgUrlStr = "image"
        case limit
        case enabled
    }
}

extension Card: Equatable {}

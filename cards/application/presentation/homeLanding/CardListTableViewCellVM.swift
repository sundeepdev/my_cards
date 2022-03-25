//
//  CardListTableViewCellVM.swift
//  cards
//
//  Created by Sundeep Singh on 20/03/22.
//

import Foundation
import UIKit

class CardListTableViewCellVM {
    var imageUrlStr: String?
    var cardName: String

    init(card: Card) {
        self.cardName = card.name
        self.imageUrlStr = card.cardImgUrlStr
    }
}

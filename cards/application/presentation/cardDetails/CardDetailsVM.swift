//
//  CardDetailsVM.swift
//  cards
//
//  Created by Sundeep Singh on 25/03/22.
//

import Foundation
import RxSwift
import RxRelay

class CardDetailsVM: BaseViewModel {
    var title: String
    var imageUrlStr: String
    var cardNumber: String
    var cardEnabled: String

    private var card: BehaviorRelay<Card>

    init(card: Card) {
        self.card = BehaviorRelay<Card>(value: card)
        self.title = "Name: \(card.name)"
        self.imageUrlStr = card.cardImgUrlStr
        self.cardNumber = "Number: \(card.number)"
        self.cardEnabled = "Enabled: \(card.enabled ? "Yes":"No")"
    }
}

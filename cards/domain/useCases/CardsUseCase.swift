//
//  cardsUseCase.swift
//  cards
//
//  Created by Sundeep Singh on 20/03/22.
//

import Foundation
import RxSwift

protocol CardsUseCase {
    func update(card: Card) -> Observable<Void>
}

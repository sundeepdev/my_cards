//
//  CardsRepositoryStub.swift
//  cardsTests
//
//  Created by Sundeep Singh on 21/03/22.
//

import Foundation
@testable import cards
import RxSwift

final class CardsRepositoryStub: CardsRepository {
    func fetchCardsList(completion: @escaping (Result<[Card], Error>) -> Void) -> Cancellable {
        var cardsList:[Card] = []
        let task = RepositoryTask()
        let card = Card(number: "8723654598562487",
                        name: "Busincess Charge",
                        type: CardType.charge,
                        cardImgUrlStr: "https://www.lloydsbank.com/assets/assets-business-banking/png/cards/businesscharge.jpg",
                        limit: 3000, enabled: true)
        
        cardsList.append(card)
        
        completion(.success(cardsList))
        return task
    }
}

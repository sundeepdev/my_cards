//
//  FetchCardsListUseCase.swift
//  cards
//
//  Created by Sundeep Singh on 21/03/22.
//

import Foundation
import RxSwift
import RxRelay

protocol FetchCardsListUseCase {
    func cardList() -> Observable<[Card]>
}

class DefaultFetchCardsListUseCase: FetchCardsListUseCase {

    let cardsRepository: CardsRepository
    private var cards: BehaviorRelay<[Card]> = BehaviorRelay<[Card]>(value: [])

    init(cardsRepository: CardsRepository) {
        self.cardsRepository = cardsRepository
    }

    func cardList() -> Observable<[Card]> {
        _ = self.cardsRepository.fetchCardsList { [weak self] (result) in

            if case .success = result {
                do {
                    self?.cards.accept(try result.get())
                } catch {
                    print(error)
                }
            }
        }
        return cards.asObservable()
    }
}

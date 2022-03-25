//
//  HomeLandingVM.swift
//  cards
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation
import RxSwift
import RxRelay

class HomeLandingVM {
    private let fetchCardsUseCase: FetchCardsListUseCase
    var cards: BehaviorRelay<[Card]> = BehaviorRelay<[Card]>(value: [])

    init(fetchCardsUseCase: FetchCardsListUseCase) {
        self.fetchCardsUseCase = fetchCardsUseCase
    }

    public func viewDidLoad() {
        _ = self.fetchCardsUseCase.cardList().subscribe( onNext: {[weak self] (cardsList: [Card]) in
            self?.cards.accept(cardsList)
        }, onError: { error in
            print("Error on viewDidLoad: \(error)")
        })
    }
}

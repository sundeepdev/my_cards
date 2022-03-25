//
//  DefaultCardRepository.swift
//  cards
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation
import RxSwift

final class DefaultCardsRepository {
//    private let dataTransferService: CardsService
//
//    init(dataTransferService: CardsService) {
//        self.dataTransferService = dataTransferService
//    }
}

extension DefaultCardsRepository: CardsRepository {
    func fetchCardsList(completion: @escaping (Result<[Card], Error>) -> Void) -> Cancellable {
        let task = RepositoryTask()
        _ = CardsNetworkManager.shared.getCards()
            .subscribe(onSuccess: { (cardsList: [Card]) in
            // we fetched the cards
            print("API response: \(cardsList)")
            completion(.success(cardsList))
        }, onFailure: { error in
            // there was an error fetching the cards
            print("Error fetch: \(error)")
            completion(.failure(error))
        })
        return task
    }
}

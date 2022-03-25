//
//  CardsRepository.swift
//  cards
//
//  Created by Sundeep Singh on 21/03/22.
//

import Foundation
import RxSwift

protocol CardsRepository {
    func fetchCardsList(completion: @escaping (Result<[Card], Error>) -> Void) -> Cancellable
}

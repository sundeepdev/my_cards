//
//  CardsNetworkManager.swift
//  cards
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation

import RxSwift
import Moya

struct CardsNetworkManager {
    static let shared = CardsNetworkManager()
    private let provider = MoyaProvider<CardsService>()
    private init() {}

    func getCards() -> Single<[Card]> {
        return provider.rx
            .request(.getCards)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([Card].self)
    }

    func updateCard(with id: Int) -> Observable<Response> {
        return provider.rx
            .request(.updateCard(id: id))
            .filterSuccessfulStatusAndRedirectCodes()
            .asObservable()
    }

}

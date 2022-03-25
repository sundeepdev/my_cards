//
//  NetworkTestingStubProvider.swift
//  cardsTests
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation
import Moya
@testable import cards

let stubbingProvider = MoyaProvider<CardsService>(stubClosure: MoyaProvider.immediatelyStub)

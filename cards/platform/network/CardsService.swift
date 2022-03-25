//
//  CardsService.swift
//  cards
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation

import Moya

extension CardsService: TargetType {

    // This is the base URL we'll be using, typically our server.
    var baseURL: URL {
    return URL(string: "https://mycards.free.beeceptor.com")!
    }

    // This is the path of each operation that will be appended to our base URL.
    var path: String {
        switch self {
        case .getCards:
            return "/cards"
        case .updateCard(let id):
            return "/cards/\(id)"
        }
    }

    // Here we specify which method our calls should use.
    var method: Moya.Method {
        switch self {
        case .getCards:
            return .get
        case .updateCard:
            return .patch
        }
    }

    // Here we specify body parameters, objects, files etc.
    // or just do a plain request without a body.
    // In this example we will not pass anything in the body of the request.
    var task: Task {
        return .requestPlain
    }

    // These are the headers that our service requires.
    // Usually you would pass auth tokens here.
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

extension CardsService {
    var sampleData: Data {
        switch self {
        case .getCards:
            return cardJson.data(using: String.Encoding.utf8)!
        case .updateCard(id: let id):
            return "\(id)".data(using: String.Encoding.utf8)!
        }
    }
}

private let cardJson = """
[{
    "card":"8723654598562487",
    "name":"Busincess Charge",
    "type": "charge",
    "image":"https://www.lloydsbank.com/assets/assets-business-banking/png/cards/businesscharge.jpg",
    "limit":3000,
    "enabled":true
}]
"""

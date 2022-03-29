//
//  DataTransferService.swift
//  cards
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation

public protocol DataTransferService {
    typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void
}

public enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkFailure(Error)
    case resolvedNetworkFailure(Error)
}

public protocol DataTransferErrorResolver {
    func resolve(error: Error) -> Error
}

public protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

public protocol DataTransferErrorLogger {
    func log(error: Error)
}

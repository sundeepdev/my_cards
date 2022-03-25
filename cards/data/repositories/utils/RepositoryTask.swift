//
//  RepositoryTask.swift
//  cards
//
//  Created by Sundeep Singh on 24/03/22.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false

    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}

public protocol NetworkCancellable {
    func cancel()
}

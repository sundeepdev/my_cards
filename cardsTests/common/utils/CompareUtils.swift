//
//  CompareUtils.swift
//  cardsTests
//
//  Created by Sundeep Singh on 20/03/22.
//

import Foundation

class Utility {

}

protocol JSONTestable {
    init?(_ json: String)
    func json() -> String?
}

extension JSONTestable where Self: Codable {
    init?(_ json: String) {
        guard
            let data = json.data(using: .utf8),
            let decoded = try? JSONDecoder().decode(Self.self, from: data)
            else { return nil }
        self = decoded
    }

    func json() -> String? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

func areEqual (_ left: Any, _ right: Any) -> Bool {
    if  type(of: left) == type(of: right) &&
        String(describing: left) == String(describing: right) { return true }
    if let left = left as? [Any], let right = right as? [Any] { return left == right }
    if let left = left as? [AnyHashable: Any], let right = right as? [AnyHashable: Any] { return left == right }
    return false
}

extension Array where Element: Any {
    static func != (left: [Element], right: [Element]) -> Bool { return !(left == right) }
    static func == (left: [Element], right: [Element]) -> Bool {
        if left.count != right.count { return false }
        var right = right
        loop: for leftValue in left {
            for (rightIndex, rightValue) in right.enumerated() where areEqual(leftValue, rightValue) {
                right.remove(at: rightIndex)
                continue loop
            }
            return false
        }
        return true
    }
}

extension Dictionary where Value: Any {
    static func != (left: [Key: Value], right: [Key: Value]) -> Bool { return !(left == right) }
    static func == (left: [Key: Value], right: [Key: Value]) -> Bool {
        if left.count != right.count { return false }
        for element in left {
            guard   let rightValue = right[element.key],
                areEqual(rightValue, element.value) else { return false }
        }
        return true
    }
}

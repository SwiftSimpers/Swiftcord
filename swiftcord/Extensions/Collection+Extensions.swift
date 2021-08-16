//
//  Collection+Extensions.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/15.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

//
//  File.swift
//  File
//
//  Created by Eric Groom on 7/19/21.
//

import Foundation

public struct Size: Equatable, Hashable {
    public let width: Double
    public let height: Double

    public init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

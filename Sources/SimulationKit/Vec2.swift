//
//  Vector.swift
//  SimulationKit
//
//  Created by Eric Groom on 7/10/21.
//

import Foundation

public struct Vec2: Equatable, Hashable {
    
    public var x: Double
    public var y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public var magnitude: Double {
        get {
            sqrt(x * x + y * y)
        }
        set {
            normalize()
            x *= newValue
            y *= newValue
        }
    }
    
    /*
     Uses atan2 so the return value is within [-𝜋, 𝜋]
     */
    public var direction: Double {
        atan2(y, x)
    }
    
    public mutating func limit(magnitude: Double) {
        guard self.magnitude > magnitude else { return }
        self.magnitude = magnitude
    }
    
    public mutating func lowerBound(magnitude: Double) {
        guard self.magnitude < magnitude else { return }
        self.magnitude = magnitude
    }
    
    public func distance(to other: Vec2) -> Double {
        sqrt((x - other.x) * (x - other.x) + (y - other.y) * (y - other.y))
    }
    
    public mutating func normalize() {
        let magnitude = self.magnitude
        if magnitude != 0 {
            x /= magnitude
            y /= magnitude
        } else {
            x = 0
            y = 0
        }
    }
    
    public var normalized: Vec2 {
        var copy = self
        copy.normalize()
        return copy
    }
    
    public static let zero = Vec2(x: 0, y: 0)
    
    public static func +(_ lhs: Self, _ rhs: Self) -> Self {
        Vec2(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func +=( _ lhs: inout Self, _ rhs: Self) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    public static func -(_ lhs: Self, _ rhs: Self) -> Self {
        Vec2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func -=( _ lhs: inout Self, _ rhs: Self) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
    public static func *(_ lhs: Self, _ rhs: Double) -> Self {
        Vec2(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    public static func *=(_ lhs: inout Self, _ rhs: Double) {
        lhs.x *= rhs
        lhs.y *= rhs
    }
    
    public static func /(_ lhs: Self, _ rhs: Double) -> Self {
        Vec2(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    public static func /=(_ lhs: inout Self, _ rhs: Double) {
        lhs.x /= rhs
        lhs.y /= rhs
    }
    
    public static prefix func -(_ vec: Self) -> Self {
        vec * -1
    }
}

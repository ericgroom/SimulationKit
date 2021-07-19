//
//  CircleSector.swift
//  SimulationKit
//
//  Created by Eric Groom on 7/15/21.
//

import Foundation

public typealias Radians = Double

public struct CircleSector {
    
    public let center: Vec2
    public let heading: Radians
    public let width: Radians
    public let radius: Double
    
    public init(center: Vec2, heading: Radians, width: Radians, radius: Double) {
        self.center = center
        self.heading = heading
        self.width = width
        self.radius = radius
    }
    
    public func contains(_ point: Vec2) -> Bool {
        guard center.distance(to: point) <= radius else { return false }
        
        let normalizedPoint = (point - center)
        let unnormalizedPointAngle = normalizedPoint.direction
        let pointAngle = unnormalizedPointAngle > 0 ? unnormalizedPointAngle : unnormalizedPointAngle + Double.pi*2
        
        // https://stackoverflow.com/a/38515984/6335864
        let dot = cos(heading)*cos(pointAngle) + sin(heading)*sin(pointAngle)
        let angle = acos(dot)
        
        return angle <= (width/2)
    }
}

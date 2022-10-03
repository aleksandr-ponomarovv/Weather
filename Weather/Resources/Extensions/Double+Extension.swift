//
//  Double+Extension.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

extension Double {
    func toTemperature() -> String {
        return toIntegerString() + "°"
    }
    
    func toSpeed() -> String {
        let speed = toIntegerString()
        return "\(speed) m/sec"
    }
    
    func toIntegerString() -> String {
        return String(format: "%.f", self)
    }
}

//
//  Data+Extension.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

extension Data {
    var json: Any? {
        return try? JSONSerialization.jsonObject(with: self, options: .mutableContainers)
    }
}

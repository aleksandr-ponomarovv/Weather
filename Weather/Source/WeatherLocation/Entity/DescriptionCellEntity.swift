//
//  DescriptionCellEntity.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

enum DescriptionSection: String, CaseIterable {
    case currentTemperature = "CURRENT TEMPERATURE"
    case feelsLike = "FEELS LIKE"
    case minTemperature = "MIN TEMPERATURE"
    case maxTemperature = "MAX TEMPERATURE"
    case humidity = "HUMIDITY"
    case wind = "WIND"
}

class DescriptionCellEntity: DescriptionTableViewCellModel {
    let title: String
    let value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}

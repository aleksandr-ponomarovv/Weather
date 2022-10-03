//
//  CityEntity.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

// MARK: - CityEntity
class City: CityTableViewCellModel, Codable {
    let id: Int
    let name, state, country: String
    let coord: Coord
    var iconUrl: String = ""

    private enum CodingKeys: String, CodingKey {
        case id
        case name, state, country
        case coord
    }
    
    init(id: Int, name: String, state: String, country: String, coord: Coord) {
        self.id = id
        self.name = name
        self.state = state
        self.country = country
        self.coord = coord
    }
}

// MARK: - Coord
class Coord: Codable {
    let lon, lat: Double

    init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

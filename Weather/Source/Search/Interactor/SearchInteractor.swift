//   
//  SearchInteractor.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol SearchInteractorType {
    var filteredCities: [City] { get }
    
    func filterCities(text: String)
}

class SearchInteractor: SearchInteractorType {
    
    var filteredCities: [City]
    
    private let cities: [City]
    private let fileManager = FileManager()
    
    init() {
        cities = fileManager.readLocalFile(for: .cityList) ?? []
        filteredCities = cities
        setupUrls()
    }
    
    func filterCities(text: String) {
        if text.isEmpty {
            filteredCities = cities
        } else {
            filteredCities = cities.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
    }
}

// MARK: - Private methods
private extension SearchInteractor {
    func setupUrls() {
        let evenUrl = "https://infotech.gov.ua/storage/img/Temp3.png"
        let oddUrl = "https://infotech.gov.ua/storage/img/Temp1.png"
        for (index, city) in cities.enumerated() {
            city.iconUrl = index % 2 == 0 ? evenUrl : oddUrl
        }
    }
}

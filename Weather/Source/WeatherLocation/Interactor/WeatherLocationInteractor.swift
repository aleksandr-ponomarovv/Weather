//   
//  WeatherLocationInteractor.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol WeatherLocationInteractorType {
    var city: City { get }
    var currentWeather: Current? { get }
    var today: Daily? { get }
    var descriptions: [DescriptionCellEntity] { get }
    
    func fetchWeather(completion: @escaping(Response<Bool>) -> Void)
}

class WeatherLocationInteractor: WeatherLocationInteractorType {
    
    let city: City
    private let weatherService = WeatherService()
    private var hourlyEntity: HourlyEntity?
    
    var currentWeather: Current? {
        hourlyEntity?.current
    }
    
    var today: Daily? {
        hourlyEntity?.daily.first
    }
    
    var descriptions: [DescriptionCellEntity] {
        getDescriptions()
    }
    
    init(city: City) {
        self.city = city
    }
    
    func fetchWeather(completion: @escaping(Response<Bool>) -> Void) {
        weatherService.getHourly(lat: city.coord.lat, lon: city.coord.lon) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let hourlyEntity):
                self.hourlyEntity = hourlyEntity
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Private methods
private extension WeatherLocationInteractor {
    func getDescriptions() -> [DescriptionCellEntity] {
        let descriptions: [DescriptionCellEntity] = DescriptionSection.allCases.compactMap { descriptionSection in
            guard let current = currentWeather,
                  let today = today else { return nil }
            
            let title = descriptionSection.rawValue
            switch descriptionSection {
            case .currentTemperature:
                return DescriptionCellEntity(title: title, value: current.temp.toIntegerString())
            case .feelsLike:
                return DescriptionCellEntity(title: title, value: current.feelsLike.toTemperature())
            case .minTemperature:
                return DescriptionCellEntity(title: title, value: today.temp.min.toTemperature())
            case .maxTemperature:
                return DescriptionCellEntity(title: title, value: today.temp.max.toTemperature())
            case .humidity:
                return DescriptionCellEntity(title: title, value: current.humidity.toPercentHumidity())
            case .wind:
                return DescriptionCellEntity(title: title, value: current.windSpeed.toSpeed())
            
            }
        }
        return descriptions
    }
}

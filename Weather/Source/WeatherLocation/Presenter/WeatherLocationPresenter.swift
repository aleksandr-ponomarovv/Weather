//   
//  WeatherLocationPresenter.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol WeatherLocationPresenterType {
    var city: City { get }
    var numberOfSections: Int { get }
    var informationCellTitle: String? { get }
    
    func viewDidLoad()
    func numberOfRowsInSection(section: Int) -> Int
    func weatherSection(by index: Int) -> WeatherSection
    func descriptionCellModel(at indexPath: IndexPath) -> DescriptionTableViewCellModel
}

class WeatherLocationPresenter: WeatherLocationPresenterType {
    
    private let interactor: WeatherLocationInteractorType
    private let router: WeatherLocationRouterType
    private weak var view: WeatherLocationViewType?
    
    // MARK: - Protocol property
    let numberOfSections: Int = WeatherSection.allCases.count
    
    var city: City {
        interactor.city
    }
    
    var informationCellTitle: String? {
        guard let current = interactor.currentWeather,
              let weather = current.weather.first,
              let description = weather.weatherDescription?.rawValue,
              let temperature = interactor.today?.temp else { return nil }
        
        let firstSentence = "Today: \(description)."
        let secondSentence = "Air temperature \(current.temp), max temperature \(temperature.max.toTemperature())"
        return "\(firstSentence) \(secondSentence)"
    }
    
    init(interactor: WeatherLocationInteractorType,
         router: WeatherLocationRouterType,
         view: WeatherLocationViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Protocol methods
    
    func viewDidLoad() {
        interactor.fetchWeather { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.view?.reloadTableView()
            case .failure:
                self.view?.hideTableView()
            }
        }
    }
    
    func weatherSection(by index: Int) -> WeatherSection {
        return WeatherSection.allCases[index]
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        let weatherSection = weatherSection(by: section)
        switch weatherSection {
        case .information:
            return 1
        case .description:
            return interactor.descriptions.count
        }
    }
    
    func descriptionCellModel(at indexPath: IndexPath) -> DescriptionTableViewCellModel {
        return interactor.descriptions[indexPath.row]
    }
}

// MARK: - Private methods
private extension WeatherLocationPresenter {
    
}

//   
//  WeatherLocationConfigurator.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol WeatherLocationConfiguratorType {
    func configure(viewController: WeatherLocationViewController)
}

class WeatherLocationConfigurator: WeatherLocationConfiguratorType {
    
    private let city: City
    
    init(city: City) {
        self.city = city
    }
    
    func configure(viewController: WeatherLocationViewController) {
        let interactor = WeatherLocationInteractor(city: city)
        let router = WeatherLocationRouter(viewController: viewController)
        let presenter = WeatherLocationPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}

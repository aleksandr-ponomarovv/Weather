//   
//  SearchRouter.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol SearchRouterType {
    func showWeatherLocationScreen(city: City)
}

class SearchRouter: SearchRouterType {
    
    private weak var viewController: SearchViewController?
    
    init(viewController: SearchViewController) {
        self.viewController = viewController
    }
    
    func showWeatherLocationScreen(city: City) {
        let weatherLocation = WeatherLocationViewController()
        let configurator: WeatherLocationConfiguratorType = WeatherLocationConfigurator(city: city)
        configurator.configure(viewController: weatherLocation)
        viewController?.navigationController?.pushViewController(weatherLocation, animated: true)
    }
}

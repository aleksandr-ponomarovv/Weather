//   
//  WeatherLocationRouter.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol WeatherLocationRouterType {
    
}

class WeatherLocationRouter: WeatherLocationRouterType {
    
    private weak var viewController: WeatherLocationViewController?
    
    init(viewController: WeatherLocationViewController) {
        self.viewController = viewController
    }
}

//   
//  SearchConfigurator.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol SearchConfiguratorType {
    func configure(viewController: SearchViewController)
}

class SearchConfigurator: SearchConfiguratorType {
    
    func configure(viewController: SearchViewController) {
        let interactor = SearchInteractor()
        let router = SearchRouter(viewController: viewController)
        let presenter = SearchPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}

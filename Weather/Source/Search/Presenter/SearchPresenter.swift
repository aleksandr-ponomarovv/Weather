//   
//  SearchPresenter.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

protocol SearchPresenterType {
    var numberOfRowsInSection: Int { get }
    
    func filterCities(text: String)
    func cityCellModel(at indexPath: IndexPath) -> CityTableViewCellModel
    func didSelectCity(at indexPath: IndexPath)
}

class SearchPresenter: SearchPresenterType {
    
    private let interactor: SearchInteractorType
    private let router: SearchRouterType
    private weak var view: SearchViewType?
    
    // MARK: - Protocol property
    
    var numberOfRowsInSection: Int {
        interactor.filteredCities.count
    }
    
    init(interactor: SearchInteractorType,
         router: SearchRouterType,
         view: SearchViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Protocol methods
    
    func filterCities(text: String) {
        interactor.filterCities(text: text)
        view?.reloadTableView()
    }
    
    func cityCellModel(at indexPath: IndexPath) -> CityTableViewCellModel {
        return interactor.filteredCities[indexPath.row]
    }
    
    func didSelectCity(at indexPath: IndexPath) {
        let city = interactor.filteredCities[indexPath.row]
        router.showWeatherLocationScreen(city: city)
    }
}

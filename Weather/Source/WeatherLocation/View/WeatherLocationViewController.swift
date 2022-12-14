//   
//  WeatherLocationViewController.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import UIKit
import MapKit

protocol WeatherLocationViewType: AnyObject {
    func reloadTableView()
    func hideTableView()
}

class WeatherLocationViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var mapHeaderView: MapHeaderView = {
        let width = tableView.frame.size.width
        let height = view.frame.size.height * 0.3
        return MapHeaderView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }()
    
    var presenter: WeatherLocationPresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        configureUI()
    }
}

// MARK: - WeatherLocationViewType
extension WeatherLocationViewController: WeatherLocationViewType {
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func hideTableView() {
        tableView.isHidden = true
    }
}

// MARK: - UIScrollViewDelegate
extension WeatherLocationViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let mapHeaderView = tableView.tableHeaderView as? MapHeaderView else { return }
        
        mapHeaderView.scrollViewDidScroll(scrollView: scrollView)
    }
}

// MARK: - UITableViewDataSource
extension WeatherLocationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else { return .init() }
        
        let weatherSection = presenter.weatherSection(by: indexPath.section)
        switch weatherSection {
        case .information:
            let cell = tableView.dequeueReusableCell(cellType: InformationTableViewCell.self, for: indexPath)
            cell.title = presenter.informationCellTitle
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(cellType: DescriptionTableViewCell.self, for: indexPath)
            cell.model = presenter.descriptionCellModel(at: indexPath)
            return cell
        }
    }
}

// MARK: - UITableViewDataSource
extension WeatherLocationViewController: UITableViewDelegate {
    
}

// MARK: - Private methods
private extension WeatherLocationViewController {
    func configureUI() {
        title = presenter?.city.name
        setupTableView()
        setupPin()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellNibType: InformationTableViewCell.self)
        tableView.register(cellNibType: DescriptionTableViewCell.self)
        tableView.tableHeaderView = mapHeaderView
    }
    
    func setupPin() {
        guard let presenter = presenter else { return }

        let coordinate = CLLocationCoordinate2D(latitude: presenter.city.coord.lat,
                                                longitude: presenter.city.coord.lon)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = presenter.city.name
        mapHeaderView.mapView.addAnnotation(pin)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapHeaderView.mapView.setRegion(region, animated: true)
    }
}

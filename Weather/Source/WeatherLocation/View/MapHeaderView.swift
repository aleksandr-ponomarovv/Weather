//
//  MapHeaderView.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import UIKit
import MapKit

final class MapHeaderView: UIView {
    
    let mapView = MKMapView()
    
    private var containerView = UIView()
    private var containerViewHeightConstraint = NSLayoutConstraint()
    private var mapViewBottomConstraint = NSLayoutConstraint()
    private var mapViewHeightConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        mapViewBottomConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
    }
}

// MARK: - Private methods
private extension MapHeaderView {
    func configureUI() {
        containerView.clipsToBounds = true
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(mapView)
    }
    
    func setupConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        mapViewBottomConstraint = mapView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        mapViewHeightConstraint = mapView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            containerView.widthAnchor.constraint(equalTo: mapView.widthAnchor),
            containerViewHeightConstraint,
            mapViewBottomConstraint,
            mapViewHeightConstraint
        ])
    }
}

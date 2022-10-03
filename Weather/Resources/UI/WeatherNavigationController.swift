//   
//  WeatherNavigationController.swift
//  Weather
//
//  Created by Aleksandr on 02.10.2022.
//

import UIKit

class WeatherNavigationController: UINavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = backItem
        super.pushViewController(viewController, animated: animated)
    }
}

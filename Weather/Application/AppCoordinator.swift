//   
//  AppCoordinator.swift
//  Weather
//
//  Created by Aleksandr on 02.10.2022.
//

import UIKit

protocol BaseCoordinator {
    func start()
}

class AppCoordinator: BaseCoordinator {
    
    private lazy var window: UIWindow? = {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil }
        let window = UIWindow(windowScene: windowScene)
        window.overrideUserInterfaceStyle = .light
        return window
    }()
    
    func start() {
        window?.rootViewController = startController()
        window?.makeKeyAndVisible()
    }
}

// MARK: - Private methods
private extension AppCoordinator {
    func startController() -> UIViewController {
        let viewController = SearchViewController()
        let configurator: SearchConfiguratorType = SearchConfigurator()
        configurator.configure(viewController: viewController)
        return WeatherNavigationController(rootViewController: viewController)
    }
}

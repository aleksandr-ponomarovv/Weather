//
//  APIManagerProtocol.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Alamofire

protocol APIManagerProtocol {
    func errorHandling(error: Error) -> ResponseError
}

extension APIManagerProtocol {
    func errorHandling(error: Error) -> ResponseError {
        let hasConnect = NetworkReachabilityManager()?.isReachable ?? false
        return hasConnect ? .serverNotResponding : .noInternetConnection
    }
}

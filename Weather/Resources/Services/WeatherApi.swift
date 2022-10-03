//
//  WeatherApi.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Alamofire

enum WeatherApi: URLRequestBuilder {
    
    case getHourly(lat: Double, lon: Double)
    
    var path: String {
        switch self {
        case .getHourly:
            return "onecall"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getHourly(let lat, let lon):
            return ["lat": lat, "lon": lon, "exclude": "minutely", "units": "metric", "appid": Constants.key]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getHourly:
            return .get
        }
    }
}

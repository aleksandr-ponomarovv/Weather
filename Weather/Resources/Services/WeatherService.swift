//
//  WeatherService.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Alamofire

final class WeatherService: APIManagerProtocol {
    
    func getHourly(lat: Double, lon: Double, completion: @escaping(Response<HourlyEntity>) -> Void) {
        let api: WeatherApi = .getHourly(lat: lat, lon: lon)
        AF.request(api).responseDecodable(of: HourlyEntity.self) { response in
            print("RESPONSE ENTITY: \(response.data?.json ?? "")")
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(self.errorHandling(error: error)))
            }
        }
    }
}

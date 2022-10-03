//
//  FileManager.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

final class FileManager {

    enum Names: String {
        case cityList = "city_list"
    }

    func readLocalFile<T: Codable>(for name: Names) -> T? {
        guard let bundlePath = Bundle.main.path(forResource: name.rawValue, ofType: "json"),
              let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8),
              let decodedData = try? JSONDecoder().decode(T.self, from: jsonData) else { return nil }
        return decodedData
    }
}

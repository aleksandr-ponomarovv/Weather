//
//  Response.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

enum Response<T: Decodable> {
    case success(T)
    case failure(ResponseError)
}

enum ResponseError: Error {
    case serverNotResponding
    case noInternetConnection
}

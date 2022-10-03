//
//  HourlyEntity.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import Foundation

// MARK: - HourlyEntity
class HourlyEntity: Codable {
    let timezone: String
    let current: Current
    let hourly: [Current]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case timezone
        case current, hourly, daily
    }

    init(timezone: String, current: Current, hourly: [Current], daily: [Daily]) {
        self.timezone = timezone
        self.current = current
        self.hourly = hourly
        self.daily = daily
    }
}

// MARK: - Current
class Current: Codable {
    let dateTime: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case sunrise
        case sunset
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case weather
    }

    init(dateTime: Int, sunrise: Int?, sunset: Int?, temp: Double, feelsLike: Double, pressure: Int, humidity: Int, dewPoint: Double, uvi: Double, clouds: Int, visibility: Int, windSpeed: Double, weather: [Weather]) {
        self.dateTime = dateTime
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.uvi = uvi
        self.clouds = clouds
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.weather = weather
    }
}

// MARK: - Weather
class Weather: Codable {
    let id: Int
    let weatherDescription: Description?
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case weatherDescription = "description"
        case icon
    }

    init(id: Int, weatherDescription: Description, icon: String) {
        self.id = id
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Daily
class Daily: Codable {
    let dateTime: Int
    let temp: Temp
    let humidity: Int
    let weather: [Weather]
    let pop: Double

    enum CodingKeys: String, CodingKey {
        case temp, humidity, weather, pop
        case dateTime = "dt"
    }

    init(dateTime: Int, temp: Temp, feelsLike: FeelsLike, pressure: Int, humidity: Int, weather: [Weather], pop: Double) {
        self.dateTime = dateTime
        self.temp = temp
        self.humidity = humidity
        self.weather = weather
        self.pop = pop
    }
}

// MARK: - FeelsLike
class FeelsLike: Codable {
    let day, night, eve, morn: Double

    init(day: Double, night: Double, eve: Double, morn: Double) {
        self.day = day
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

// MARK: - Temp
class Temp: Codable {
    let min, max, night: Double

    init(min: Double, max: Double, night: Double) {
        self.min = min
        self.max = max
        self.night = night
    }
}

//
//  Weather+MappingTest.swift
//  BambooAssessmentTests
//
//  Created by Guru King on 31/03/2023.
//

import Foundation

import XCTest
@testable import BambooAssessment

class WeatherDtoMappingTests: XCTestCase {

    var weatherresponse:WeatherResponse?
    override func setUp() {
       
        weatherresponse = WeatherResponse(coord: Coord(lon: 10.0, lat: 90.1), weather: [Weather(id: 1, main: "Rain", description: "Rain", icon: "02d")], base: "base", main: Main(temp: 20, feelsLike: 20, tempMin: 20.2, tempMax: 20.5, pressure: 20, humidity: 10), visibility: 10, wind: Wind(speed: 10, deg: 1), rain: Rain(the1H: 1.0), clouds: Clouds(all: 1), dt: 1, sys: Sys(type: 1, id: 1, country: "GB", sunrise: 2, sunset: 4), timezone: 456, id: 1, name: "london", cod: 1)
    }
    
    func testConvertResponseToWeatherDomain(){
        XCTAssertNotNil(weatherresponse?.toDomain())
    }
    
    func testWeatherDtoConvertToDomain(){
        //Given
        let weather = WeatherDomain(id: "1", mintemp: 20.2, maxtemp: 20.5, lat: "90.1", lon: "10.0", temp: 20, icon: "https://openweathermap.org/img/wn/02d@2x.png", cond: "Rain", cloud: "1%", sunrise: "01:00", sunset: "01:00", city: "london")
        
        //When
        let domainweather = weatherresponse?.toDomain()
        
        //Then
        XCTAssertEqual(weather.id, domainweather?.id)
        XCTAssertEqual(weather.mintemp, domainweather?.mintemp)
        XCTAssertEqual(weather.maxtemp, domainweather?.maxtemp)
        XCTAssertEqual(weather.lat, domainweather?.lat)
        XCTAssertEqual(weather.lon, domainweather?.lon)
        XCTAssertEqual(weather.temp, domainweather?.temp)
        XCTAssertEqual(weather.icon, domainweather?.icon)
        XCTAssertEqual(weather.cond, domainweather?.cond)
        XCTAssertEqual(weather.cloud, domainweather?.cloud)
        XCTAssertEqual(weather.sunset, domainweather?.sunset)
        XCTAssertEqual(weather.sunrise, domainweather?.sunrise)
        XCTAssertEqual(weather.city, domainweather?.city)
    }
}


//
//  SearchViewModel.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit
import RxSwift

final class SearchDetailViewModel{
    
    var weather:WeatherDomain?

    init(weather:WeatherDomain?){
        self.weather = weather
    }
    
    func createWeatherDataList(_ weather:WeatherDomain, _ tempType:Temp) -> [WeatherData]{
        let mintemp = tempType == .celcius ? fahrenheitToC(f: weather.mintemp) : toFahrenheit(f: weather.mintemp)
        let maxtemp = tempType == .celcius ? fahrenheitToC(f: weather.maxtemp) : toFahrenheit(f: weather.maxtemp)
        return [
            WeatherData(title: "Min temperature", value: mintemp),
            WeatherData(title: "Max temperature", value: maxtemp),
            WeatherData(title: "Cloud coverage", value: weather.cloud),
            WeatherData(title: "Latitude", value: weather.lat),
            WeatherData(title: "Longitude", value: weather.lon),
            WeatherData(title: "Sunrise", value: weather.sunrise),
            WeatherData(title: "Sunset", value: weather.sunset),
        ]
    }

    func fahrenheitToC(f:Double) -> String{
        let cel = (f - 32) * 5/9
        return "\(String(format: "%.2f", cel))°C"
    }
    
    func toFahrenheit(f:Double) -> String{
        return "\(String(format: "%.2f", f))°F"
    }
}

struct WeatherData{
    let title:String
    let value:String
}

enum Temp{
    case celcius
    case fahrenheit
}

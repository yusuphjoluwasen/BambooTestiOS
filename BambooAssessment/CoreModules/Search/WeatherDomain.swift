//
//  WeatherDto.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation
import UIKit

struct WeatherDomain:Identifiable, Hashable{
    typealias Identifier = String
    var id: Identifier
    let mintemp:Double
    let maxtemp:Double
    let lat:String
    let lon:String
    let temp:Double
    let icon:String
    let cond:String
    let cloud:String
    let sunrise:String
    let sunset:String
    let city:String
}

extension WeatherResponse {
    func toDomain() -> WeatherDomain{
        let mintemp = main?.tempMin
        let maxtemp = main?.tempMax
        let lat = coord?.lat.toDouble.toString()
        let lon = coord?.lon.toDouble.toString()
        let temp = main?.temp
        let cloud = clouds?.all?.toString()
        let sunrise = sys?.sunrise?.doubleValue.getDateStringFromUTC()
        let sunset = sys?.sunset?.doubleValue.getDateStringFromUTC()
        let city = name.toString
        var icon = ""
        var cond = ""
        if !(weather?.isEmpty ?? false){
            icon = weather?[0].icon ?? ""
            cond = weather?[0].main ?? ""
        }
        
        return .init(id: id.toInt.toString(), mintemp: mintemp.toDouble, maxtemp: maxtemp.toDouble, lat: lat.toString, lon: lon.toString, temp: temp.toDouble, icon: "https://openweathermap.org/img/wn/\(icon)@2x.png", cond: cond, cloud: "\(cloud.toString)%", sunrise: sunrise.toString,sunset: sunset.toString,city: city)
    }
}



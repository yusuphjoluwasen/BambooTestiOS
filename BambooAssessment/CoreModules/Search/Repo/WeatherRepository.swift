//
//  WeatherRepository.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation
import RxSwift
import Moya

typealias WeatherNetworking = Networking<API>

protocol WeatherRepositoryProtocol {
    func fetch(req: WeatherRequest) -> Single<WeatherDomain?>
}

final class WeatherRepository:WeatherRepositoryProtocol{
    
    let network:WeatherNetworking
    
    init(network:WeatherNetworking) {
        self.network = network
    }

    func fetch(req:WeatherRequest) -> Single<WeatherDomain?> {
        let params:[String : String] = ["q":req.city, "lat":req.lat, "lon":req.lon, "appid":AppConstant.appid]
        print(params)
        return network
            .request(.search(params: params))
            .map(WeatherResponse.self)
            .map{ $0.toDomain() }
    }
}

enum AppConstant{
    static let appid = "5429b6a8bee19bb06bb4ef54409fe206"
}

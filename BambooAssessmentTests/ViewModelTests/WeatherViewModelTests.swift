//
//  WeatherViewModelTests.swift
//  BambooAssessmentTests
//
//  Created by Guru King on 31/03/2023.
//

import Foundation
import XCTest
import RxTest
import RxBlocking
import RxSwift
import Moya
import struct RxCocoa.Driver

@testable import BambooAssessment
class WeatherViewModelTests:XCTestCase{
    
    var testScheduler: TestScheduler!
    var viewModel:SearchViewModel!
    var bag:DisposeBag!
    var repo:WeatherRepositoryProtocol!
    
    override func setUp() {
        testScheduler = TestScheduler(initialClock: 0)
        repo = WeatherRepository(network: WeatherNetworking(provider: MoyaProvider<API>(stubClosure: MoyaProvider.immediatelyStub)))
        viewModel = SearchViewModel(repo: repo)
        bag = DisposeBag()
    }
    
    override func tearDown() {
        testScheduler = nil
        viewModel = nil
        bag = nil
        repo = nil
    }
    
    func test_fetch_weather_failed() {
        // Given
        let input = SearchViewModel.Input(tap: .empty(),lat: "",lon: "", city: "")
        let output = viewModel.fetch(input: input)
        
        // When
        testScheduler.start()
        let data = try! output.weatherData.toBlocking().first() ?? nil
        
        // Then
        XCTAssertNil(data)
    }
    
    func test_fetch_weathersuccessfully() {
        // Given
        let tap = testScheduler
            .createColdObservable([
                .next(10, ())
            ])
            .asObservable()
        
        let input = SearchViewModel.Input(tap: tap, lat: "",lon: "", city: "")
        let output = viewModel.fetch(input: input)
        let weatherdomain = testScheduler.createObserver(WeatherDomain?.self)

        output.weatherData
            .bind(to: weatherdomain)
            .disposed(by: bag)
        
        // When
        testScheduler.start()
        
        // Then
        XCTAssertEqual(weatherdomain.events, [
            .next(10, WeatherDomain(id: "2643743", mintemp: 285.85, maxtemp: 289.77, lat: "51.5085", lon: "-0.1257", temp: 288.23, icon: "https://openweathermap.org/img/wn/10d@2x.png", cond: "Rain", cloud: "75%", sunrise: "06:41", sunset: "19:28", city: "London"))
        ])
    }
    
    func test_weather_data_observed_succesffully() {
        // Given
        let tap = testScheduler
            .createHotObservable([
                .next(10, ())
            ])
            .asObservable()
        
        let input = SearchViewModel.Input(tap: tap, lat: "",lon: "", city: "")
        let output = viewModel.fetch(input: input)

        var weather:WeatherDomain?
        
        // Then
        output.weatherData.asDriver(onErrorJustReturn: nil)
            .drive(onNext: { weatherDomain in
                weather = weatherDomain
            })
            .disposed(by: bag)
    
        // When
        testScheduler.start()
        
        XCTAssertEqual(weather?.city ?? "", "London")
        XCTAssertEqual(weather?.sunrise ?? "", "06:41")
    }
}



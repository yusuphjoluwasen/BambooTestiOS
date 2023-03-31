//
//  SearchViewModel.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import RxSwift
import RxCocoa

final class SearchViewModel{
    struct Input {
        let tap: Observable<Void>
        var lat:String = ""
        var lon:String = ""
        var city:String = ""
    }
    
    struct Output {
        let weatherData: Observable<WeatherDomain?>
    }
    
    private let bag = DisposeBag()
    var repo:WeatherRepositoryProtocol!
    
    init(repo:WeatherRepositoryProtocol) {
        self.repo = repo
    }
    
    func fetch(input:Input) -> Output{
        let activityTracker = ActivityIndicator()
        dump(input.lat)
        let data = input.tap
            .flatMapLatest { [unowned self] _ in
                return repo
                    .fetch(req: WeatherRequest(lat: input.lat, lon: input.lon, city: input.city))
                    .trackActivity(activityTracker)
            }
        
        return Output(weatherData: data)
    }
}

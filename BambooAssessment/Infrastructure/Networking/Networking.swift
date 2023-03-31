//
//  Networking.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//


import Foundation
import RxSwift
import Moya

protocol NetworkingProtocol{
    associatedtype Target:TargetType
    func request( _ target: Target) -> Single<Response>
}

final class Networking<Target: TargetType>:NetworkingProtocol{
    private let provider: MoyaProvider<Target>
    
    init(provider: MoyaProvider<Target> = MoyaProvider<Target>()) {
        self.provider = provider
    }
    
    func request( _ target: Target) -> Single<Response>{
        return provider.rx.request(target)
            .catchAPIError(APIErrorResponse.self)
            .filterSuccessfulStatusCodes()
    }
}



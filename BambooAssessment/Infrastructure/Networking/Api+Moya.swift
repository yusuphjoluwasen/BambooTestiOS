//
//  Api+Moya.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation
import Moya

enum API {
    case search(params: [String:String])
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5") else {
            fatalError("Base URL is invalid")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "/weather"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return MockLoader.load(file: "weather")
    }
    
    var task: Task {
        switch self {
        case .search(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

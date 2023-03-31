//
//  ApiError.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation
import Moya
import RxSwift

struct APIErrorResponse: Decodable {
    let message: String?
}

enum APIError: Error  {
    
    case apiKeyExpired
    
    case with(message: String)
    
    init(stautsCode: Int, message: String) {
        switch stautsCode {
        case 500:
            self = .apiKeyExpired
        default:
            self = .with(message: message)
        }
    }
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .apiKeyExpired:
            return NSLocalizedString("The API key has expired. Please contact the developer.", comment: "")
        case .with(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    
    func catchAPIError(_ type: APIErrorResponse.Type) -> Single<Element> {
        return flatMap { response in
            guard (200...299).contains(response.statusCode) else {
                do {
                    let apiErrorResponse = try response.map(type.self)
                    throw APIError(stautsCode: 0, message: apiErrorResponse.message ?? "Something went wrong")
                } catch {
                    throw error
                }
            }
            
            return .just(response)
        }
    }
    
}

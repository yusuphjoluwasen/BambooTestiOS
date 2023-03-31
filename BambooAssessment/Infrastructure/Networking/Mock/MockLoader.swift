//
//  MockLoader.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation
import RxSwift

struct MockLoader {
    static func load(file: String) -> Data {
        if let path = Bundle.main.path(forResource: file, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            return data
        }
        return Data()
    }
}

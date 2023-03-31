//
//  PrimitiveExtensions.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation

extension Int {
    var doubleValue: Double {
        return Double(self)
    }
    
    func toString() -> String {
        return  String(describing: self )
    }
}

extension Double {
    func toString() -> String {
        return  String(describing: self )
    }
}

extension String {
    func toInt()->Int{
        return (self as NSString).integerValue
    }
}

extension Optional {
    public func or(other: Wrapped) -> Wrapped {
        if let ret = self {
            return ret
        } else {
            return other
        }
    }
}

extension Optional where Wrapped == String {
    var toString:String {
        return self.or(other: "")
    }
}

extension Optional where Wrapped == Int {
    var toInt:Int {
        return self.or(other: 0)
    }
}

extension Optional where Wrapped == Double {
    var toDouble:Double {
        return self.or(other: 0.0)
    }
}

extension Double {
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

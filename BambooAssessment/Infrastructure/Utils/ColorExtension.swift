//
//  ColorExtension.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit

extension UIColor{
    static func hexStringToUIColor (hex:String, alpha:CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    static let primaryColor : UIColor = hexStringToUIColor(hex: "#3A3F47", alpha: 1)
    static let secondaryColor : UIColor = hexStringToUIColor(hex: "#8B9A47", alpha: 1)
    static let tertiaryColor : UIColor = hexStringToUIColor(hex: "#EEEEEE", alpha: 1)
    static let backgroundColor : UIColor = hexStringToUIColor(hex: "#E5E5E5", alpha: 1)
    static let disabledColor : UIColor = hexStringToUIColor(hex: "#7A7E85", alpha: 1)
   
}


extension UIColor{
    public static let genColor: UIColor = UIColor(named: "GenColor") ?? .yellow
}

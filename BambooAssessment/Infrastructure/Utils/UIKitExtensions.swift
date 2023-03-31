//
//  UIKitExtensions.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit

extension UIButton{
    
    public func setUpButton(text:String = "", font:UIFont = .systemFont14Regular, bgcolor:UIColor = .systemBlue, color:UIColor = .white){
        self.setTitle(text, for: .normal)
        self.backgroundColor = bgcolor
        self.titleLabel?.font = font
        self.setTitleColor(color, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
    }
}

extension UIView{
    public func setUpView(bgColor:UIColor = .clear, cornerRadius:CGFloat = 0.0){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
    }
}

extension UITextField{
    public func setUpNormalTextField(_ prop:TextFieldProps){
        self.translatesAutoresizingMaskIntoConstraints = false
        let placeholder = NSAttributedString(string: prop.placeholderString, attributes:
                                                [NSAttributedString.Key.foregroundColor : prop.placehHolderColor])
        self.font = font
        self.textColor = prop.disPlayTextColor
        self.tintColor = .orange
        self.setLeftPaddingPoints(10)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = prop.outlineColor.cgColor
        self.attributedPlaceholder = placeholder
        self.layer.cornerRadius = prop.cornerRadius
        self.keyboardType = prop.keyboard_type
    }
    
    public func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    public func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

public struct TextFieldProps{
    public let placeholderString:String
    public let secureTextEntry:Bool = false
    public let keyboard_type:UIKeyboardType = .default
    public let disPlayTextColor:UIColor = .primaryColor
    public let placehHolderColor:UIColor = .genColor
    public let font:UIFont = .systemFont14Regular
    public let outlineColor:UIColor = .clear
    public let cornerRadius:CGFloat = 0
}

//MARK: UILabel
extension UILabel {
    public func setUpGenLabel(text:String, textColor:UIColor = UIColor.genColor, font:UIFont, numberOfLines:Int = 1,textAlignment:NSTextAlignment = .left){
        self.text = text
        self.font = font
        self.textColor = textColor
        self.sizeToFit()
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension UIViewController{
    public func simpleAlert(alertType:UIAlertController.Style? = .alert, title:String?, message:String = "", action:(() -> ())? = nil){
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: alertType ?? .alert)
        actionSheet.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{ (handler) in
            action!()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    public func setUpNavigationTitle(_ title:String?){
        self.navigationItem.title = title
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationItem.standardAppearance = appearance
        appearance.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}





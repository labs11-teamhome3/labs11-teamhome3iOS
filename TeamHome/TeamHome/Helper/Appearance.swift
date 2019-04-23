//
//  Appearance.swift
//  TeamHome
//
//  Created by Daniela Parra on 1/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import Foundation
import UIKit
import Material

enum Appearance {
    
    //New Theme
    static let darkBackgroundColor = UIColor(red: 0/255.0, green: 10/255.0, blue: 18/255.0, alpha: 1.0)
    static let buttonBackgroundColor = UIColor(red: 79/255.0, green: 195/255.0, blue: 247/255.0, alpha: 1.0)
    //static let lightGrayColor = UIColor(red: 79/255.0, green: 91/255.0, blue: 98/255.0, alpha: 1.0)
    //static let boldGrayColor = UIColor(red: 38/255.0, green: 50/255.0, blue: 56/255.0, alpha: 1.0)
    //static let ligthBlueColor = UIColor(red: 139/255.0, green: 246/255.0, blue: 255/255, alpha: 1.0)
    //static let darkBlueColor = UIColor(red: 0/255.0, green: 147/255.0, blue: 196/255.0 , alpha: 1.0)
    static let redLikeColor = UIColor(red: 229/255.0, green: 115/255.0, blue: 115/255.0, alpha: 1.0)
    
    //static let darkBackgroundColor = UIColor(red: 23/255.0, green: 19/255.0, blue: 27/255.0, alpha: 1.0)
    //static let buttonBackgroundColor = UIColor(red: 121/255.0, green: 46/255.0, blue: 74/255.0, alpha: 1.0)
    static let ligthBlueColor = UIColor(red: 139/255.0, green: 246/255.0, blue: 255/255, alpha: 1.0)
    static let boldGrayColor = UIColor(red: 38/255.0, green: 50/255.0, blue: 56/255.0, alpha: 1.0)
    static let darkGrayPrimary = UIColor(red: 0/255.0, green: 10/255.0, blue: 18/255.0, alpha: 1.0)
    static let yellowColor = UIColor(red: 250/255.0, green: 237/255.0, blue: 38/255.0, alpha: 1.0)
    static let darkBlueColor = UIColor(red: 0/255.0, green: 147/255.0, blue: 196/255.0 , alpha: 1.0)
    static let grayColor = UIColor(red: 38/255.0, green: 50/255.0, blue: 56/255.0, alpha: 1.0)
    static let beigeColor = UIColor(red: 157/255.0, green: 141/255.0, blue: 143/255.0, alpha: 1.0)
    static let lightGrayColor = UIColor(red: 79/255.0, green: 91/255.0, blue: 98/255.0, alpha: 1.0)
    
    static func setTheme() {
        UIButton.appearance().tintColor = Appearance.yellowColor
        
        UINavigationBar.appearance().barTintColor = Appearance.darkGrayPrimary
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().tintColor = .white
        let titleFont = Appearance.setTitleFont(with: .title1, pointSize: 20)
        let titleAttributes = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: Appearance.yellowColor]
        let titleLargeFont = Appearance.setTitleFont(with: .title1, pointSize: 30)
        let titleLargeAttributes = [NSAttributedString.Key.font: titleLargeFont, NSAttributedString.Key.foregroundColor: Appearance.yellowColor]
        
        UINavigationBar.appearance().titleTextAttributes = titleAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = titleLargeAttributes
        
        UITabBar.appearance().barTintColor = Appearance.grayColor
        UITabBar.appearance().tintColor = Appearance.yellowColor
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Appearance.yellowColor], for: .selected)
        
        UITextField.appearance().keyboardAppearance = .dark
        UISwitch.appearance().onTintColor = Appearance.boldGrayColor
        UISegmentedControl.appearance().tintColor = Appearance.grayColor
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Appearance.yellowColor], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Appearance.yellowColor], for: .normal)
    }
    
    // Style button with button background color
    static func styleLandingPage(button: UIButton) {
        button.backgroundColor = Appearance.darkGrayPrimary
        button.layer.cornerRadius = button.frame.height / 2
        button.contentEdgeInsets.top = 10
        button.contentEdgeInsets.bottom = 10
        button.layer.borderWidth = 0
        button.layer.borderColor = Appearance.yellowColor.cgColor
        button.setTitleColor(.white, for: .normal)
    }
    
    static func styleOrange(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = Appearance.yellowColor.cgColor
        button.layer.cornerRadius = 6
        button.contentEdgeInsets.top = 10
        button.contentEdgeInsets.bottom = 10
        button.contentEdgeInsets.left = 10
        button.contentEdgeInsets.right = 10
        button.tintColor = Appearance.grayColor
        button.setTitleColor(.white, for: .normal)
    }
    
    static func setTitleFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Comfortaa", size: pointSize) else {
            fatalError("The font wasn't found. Check the name again.")
        }
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
}

extension UIViewController {
    func setUpViewAppearance() {
        view.backgroundColor = Appearance.darkBlueColor
        
        UILabel.appearance().textColor = .white
        
    }
    
}

//
//  Color+Extensions.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import SwiftUI

extension Color {
    
    static let base = Color(.gray)
    static let grayish = Color(.white)
    static let greenish = Color(.green)
    static let darkShadow = Color(.black)
    
    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
}

extension UIColor {
    convenience init(hex: String) {
        var inputString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if inputString.hasPrefix("#") {
            inputString.remove(at: inputString.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        
        Scanner(string: inputString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

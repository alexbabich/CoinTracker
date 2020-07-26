//
//  CoinViewModel.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import SwiftUI

struct CoinViewModel: Identifiable {
    var id: UUID {
        return UUID()
    }
    
    private let coin: Coin
    
    var name: String {
        return coin.name
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: Double(coin.price)! as NSNumber)!
    }
    
    var symbol: String {
        return coin.symbol.lowercased()
    }
    
    var iconUrl: String {
        print(coin.iconUrl)
        return coin.iconUrl
    }
    
    var color: Color {
        return Color(hex: coin.color)
    }
    
    var change: Double {
        return coin.change
    }
    
    var history: [Double] {
        let histNums = coin.history.map { value in
            Double(value)!
        }
        
        let min = histNums.min()!
        let max = histNums.max()!
        
        var computedValues = [Double]()
        for item in histNums {
            computedValues.append(item.converting(from: min...max, to: 0...1))
        }
        
        return computedValues
    }
    
    init(_ coin: Coin) {
        self.coin = coin
    }
}

//
//  Coin.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import Foundation

struct Coin: Decodable {
    let name: String
    let price: String
    let symbol: String
    let iconUrl: String
    let color: String
    let change: Double
    let history: [String]
}

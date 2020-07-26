//
//  CoinData.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    let coins: [Coin]
}

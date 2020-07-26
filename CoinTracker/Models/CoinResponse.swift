//
//  CoinResponse.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import Foundation


struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}

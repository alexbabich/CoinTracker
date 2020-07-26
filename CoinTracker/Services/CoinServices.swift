//
//  CoinServices.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import Foundation
import Combine

final class CoinServices {
    
//    let url = URL(string: "https://api.coinranking.com/v1/public/coins?base=USD&itemPeriod=7d&symbols=btn,eth,usdt,xrp,bch,ada,ltc,cro")
    
    let symbols = ["btn","eth","usdt","xrp","bch","ada","ltc","cro"]
    
    lazy var urlComonents: URLComponents = {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.coinranking.com"
        component.path = "/v1/public/coins"
        component.queryItems = [
            URLQueryItem(name: "base", value: "USD"),
            URLQueryItem(name: "timePeriod", value: "7d"),
            URLQueryItem(name: "symbols", value: symbols.joined(separator: ","))
        ]
        
        return component
    }()
    
    func getCoins() -> AnyPublisher<CoinResponse, Error>? {
        guard let url = urlComonents.url else { return nil }
        
        print(url)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: CoinResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

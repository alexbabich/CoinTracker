//
//  CoinListViewModel.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    @Published var coins = [CoinViewModel]()
    
    private let coinService = CoinServices()
    
    var cancellable: AnyCancellable?
    
    func getCoins() {
         
        guard let getCoins = coinService.getCoins() else {
            print("no data")
            return
        }
        
        cancellable = getCoins.sink(receiveCompletion: { err in
            print(err)
        }) { coinRes in
            self.coins = coinRes.data.coins.map { CoinViewModel($0) }
        }
    }
}

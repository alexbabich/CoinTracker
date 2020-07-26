//
//  ContentView.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var vm = CoinListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        
        vm.getCoins()
    }
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.base
            List {
                VStack (alignment: .center) {
                    Text("Coin Tracker")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .neumorphicShadow()
                    
                    ForEach(vm.coins) { coin in
                        CoinCell(coin: coin)
                            .neumorphicShadow()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

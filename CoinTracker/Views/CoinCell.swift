//
//  CoinCell.swift
//  CoinTracker
//
//  Created by Alex Babich on 26.07.2020.
//  Copyright © 2020 Alex Babich. All rights reserved.
//

import SwiftUI

struct CoinCell: View {
    let coin: CoinViewModel
    
    private let positiveChangeColor = Color.greenish
    private let negativeChangeColor = Color.red
    
    @State private var showGraph = false
    @State private var selectedItem: CoinViewModel?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
//                Image(coin.symbol)
//                    .resizable()
//                    .frame(width: 60, height: 60)
//                    .padding(2)
//                    .background(coin.color)
//                    .cornerRadius(30)
                
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .foregroundColor(Color.greenish)
                    
                    Text(String(format: "%@%0.02f", coin.change > 0.0 ? "+" : "", coin.change))
                        .foregroundColor(coin.change > 0.0 ? positiveChangeColor : negativeChangeColor)
                }
                
                Spacer()
                
                VStack {
                    Text(coin.formattedPrice)
                        .foregroundColor(Color.grayish)
                }
            }
            .neumorphicShadow()
            .padding()
            .background(
                Text(coin.symbol.uppercased())
                    .font(.system(size: 65))
                    .rotationEffect(.degrees(-45))
                    .foregroundColor(Color.darkShadow)
                    .opacity(0.1)
                    .neumorphicShadow()
                    .offset(x: 100)
            )
            .background(Color.base)
            .cornerRadius(20)
            .padding()
            .onTapGesture {
                    self.showGraph.toggle()
            }
            
            if self.showGraph {
                GraphView(data: coin.history)
                    .frame(height: 200)
                    .offset(y: -25)
            }
        }
    }
}

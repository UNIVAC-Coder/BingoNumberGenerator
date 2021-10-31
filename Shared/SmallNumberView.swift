//
//  SmallNumberView.swift
//  BingoNumberGenerator
//
//  Copyright 2021 Thomas Cavalli on 8/9/21.
//  MIT License

import SwiftUI

struct SmallNumberView: View {
    var index : Int
    var rank  : Int
    var second: [Int]
    var geometry: GeometryProxy
    var body: some View {
        VStack { //Little rank previous number
        Text( index > rank ? BLetter(i: second[index - 1 - rank]) : "  ")
            .frame(width: geometry.size.width / 6.0, height: geometry.size.height / 32.0 * 1.4, alignment: .center)
            .font(.system(size: geometry.size.height / 32.0 * 1.2))
            .foregroundColor(Color.green)
    
        Text( index > rank ? "\(second[index - 1 - rank])" : "  ")
            .frame(width: geometry.size.width / 6.0, height: geometry.size.height / 32.0 * 1.4, alignment: .center)
            .font(.system(size: geometry.size.height / 32.0 * 1.2))
            .foregroundColor(Color.green)
        }
    }
}

func BLetter(i: Int) -> String {
    var a = " "
    if i > -1 {a = "B"}
    if i > 15 {a = "I"}
    if i > 30 {a = "N"}
    if i > 45 {a = "G"}
    if i > 60 {a = "O"}
    return a
}
/*
struct SmallNumberView_Previews: PreviewProvider {
    static var previews: some View {
        SmallNumberView(index: 1, rank: 0, second: [0,1], geometry: ???)
        
    }
}
*/

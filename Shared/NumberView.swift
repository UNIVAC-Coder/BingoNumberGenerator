//
//  NumberView.swift
//  BingoNumberGenerator
//
//  Created by Tom Cavalli on 8/13/21.
//

import SwiftUI

struct NumberView: View {
    var aNumber: Int
    @Binding var isSelected: [Bool]
    var geometry: GeometryProxy
    @Binding var timer: Bool
    var body: some View {
        Text(String(aNumber))
            .frame(width: geometry.size.width / 6.0, height: geometry.size.height /  32.0 * 1.1, alignment: .center)
            .font(Font.system(size: geometry.size.height / 32.0 ))
        .foregroundColor( isSelected[aNumber] ?
                          Color.green : Color("NumberColor"))
        .onTapGesture { // for future coding...
            //self.isSelected[aNumber].toggle()
            timer = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.timer = false
            }
        }
    }
}
/*
struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(aNumber: 1, isSelected: .constant( [true, true]), geometry: GeometryProxy, timer: .constant(false))
    }
}
*/

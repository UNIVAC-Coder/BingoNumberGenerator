//
//  BigLetter.swift
//  BingoNumberGenerator
//
//  Copyright 2021 Thomas Cavalli on 8/9/21.
//  MIT License

import SwiftUI

struct BigLetterView: View {
    var aBigLetter: String
    var geometry: GeometryProxy
    var body: some View {
        Text(aBigLetter)
            .frame(width: geometry.size.width / 6.0, height: geometry.size.height / 32.0 * 3.0 , alignment: .center)
            .font(Font.system(size: geometry.size.height / 32.0 * 3.0))
            .foregroundColor(Color("TextColor"))
    }
}
/*
struct BigLetter_Previews: PreviewProvider {
    static var previews: some View {
        BigLetterView(aBigLetter: "B", geometry: GeometryProxy)
    }
}
*/

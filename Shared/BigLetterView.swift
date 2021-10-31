//
//  BigLetter.swift
//  BingoNumberGenerator
//
//  Created by Tom Cavalli on 9/8/21.
//

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

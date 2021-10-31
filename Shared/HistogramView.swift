//
//  HistoryView.swift
//  BingoNumberGenerator
//
//  Created by Tom Cavalli on 9/24/21.
//

import SwiftUI

struct HistogramView: View {
    @Binding var histogram:  Bool
    @Binding var counts: [Int]
    @Binding var history: Bool
    @State private var confirm: Bool = false
    
    var body: some View {
        GeometryReader() { geometry in
            ScrollView() {
                VStack(alignment: .leading, spacing: 15.0) {
                    Spacer()
                    HStack {
                        Button(confirm ? "Confirm Clear" : "Back") {
                            if confirm {
                                self.confirm = false
                                for i in 1...75 {
                                    self.counts[i] = 0
                                }
                            }else{
                                self.histogram = false
                                self.confirm = false
                            }
                        }
                        .padding()
                        Button(confirm ? " CANCEL" : "Clear") {
                            confirm.toggle()
                        }
                        .padding()
                        Button(confirm ? "" : " Number History") {
                            self.history = true
                        }
                        .disabled(confirm)
                    }
                    Text("Number: Count   |  Histogram")
                    ForEach((1...75), id: \.self) { i in
                        HStack(alignment: .center, spacing: 2.0) {
                            Text(String(i) + ":  ").frame(width: 55.0, alignment: .trailing)
                            Text(String(counts[i])).frame(width: 30.0, alignment: .trailing)
                            Text("    |").frame(width: 45.0, alignment: .trailing)
                            ForEach((0...counts[i]), id: \.self) { j in
                                if j > 0 { Text("X").frame(width: 11.0, alignment: .trailing) }
                            }
                        }
                        .frame(height: geometry.size.height / 160.0, alignment: .leading)
                    }
                    Spacer()
                }
            }
        }
    }
}
/*
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: .constant(true))
    }
}
*/

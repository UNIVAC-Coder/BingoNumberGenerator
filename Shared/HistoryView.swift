//
//  History.swift
//  BingoNumberGenerator
//
//  Created by Tom Cavalli on 9/25/21.
//

import SwiftUI
var a: String = ""

struct HistoryView: View {
    @Binding var memory: [Int]
    @Binding var game: Int
    @Binding var histogram : Bool
    @Binding var history: Bool
    @Binding var began: Bool
    @Binding var counts: [Int]
    @Binding var isSelected: [Bool]
    @Binding var index: Int
    @State private var confirm: Bool = false
    
    var body: some View {
        VStack {
            Text("History of Numbers.")
            Text(" ")
            Text("   Erase will delete all history and histogram numbers and restart at Game#1 when confirmed.")
            HStack {
                Button(confirm ? " Cancel" : " Erase") {
                    confirm.toggle()
                }
                .padding()
                Button(confirm ? " Confirm" : " Back") {
                    if confirm {
                        memory.removeAll(keepingCapacity: true)
                        for i in 1...75 {
                            counts[i] = 0
                            isSelected[i] = true
                        }
                        index = -1
                        began = false
                        histogram = false
                        history = false
                        began = false
                        game = 0
                    }else{
                        history = false
                    }
                }
                .padding()
            }
            ScrollView() {
                if memory.count > 0 {
                    ForEach ((0...memory.count - 1), id: \.self) { i in
                        memory[i] < 0   ? Text(" BINGO Game#\(String(memory[i] * -1 ))")
                                        : Text(" \(ALetter(number: memory[i])) \(String(memory[i]))")
                                            .font(.system(size: 18.0))
                    }
                }
            }
        }
    }
}

func ALetter(number: Int) -> String {
    if number >  0 { a = "B" }
    if number > 15 { a = "I" }
    if number > 30 { a = "N" }
    if number > 45 { a = "G" }
    if number > 60 { a = "O" }
    return a
}
/*
struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
*/

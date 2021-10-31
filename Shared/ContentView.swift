//
//  ContentView.swift
//  Shared
//
//  Copyright 2021 Thomas Cavalli on 8/9/21.
//  MIT License

import SwiftUI

struct ContentView: View {
    @State private var isSelected: [Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
    @State private var numbers: [Int] = [0]
    @State private var first  : [Int] = [0]
    @State private var second : [Int] = [0]
    @State private var index  :  Int  = -1
    @State private var timer  :  Bool = true
    @State private var confirm:  Bool = false
    @State private var began  :  Bool = false
    @State private var histogram:  Bool = false
    @State private var memory : [Int] = []
    @State private var counts : [Int] = []
    @State private var game   :  Int = 0
    @State private var history: Bool = false
    var body: some View {
        if histogram {
            if history {
                HistoryView(memory: $memory, game: $game, histogram: $histogram, history: $history, began: $began, counts: $counts, isSelected: $isSelected, index: $index)
            }else{
                HistogramView(histogram: $histogram, counts: $counts, history: $history)
            }
        }else{
            BingoView(isSelected: $isSelected, numbers: $numbers, first: $first, second: $second, index: $index, timer: $timer, confirm: $confirm, began: $began, histogram: $histogram, memory: $memory, counts: $counts, game: $game)
        }
        
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
*/

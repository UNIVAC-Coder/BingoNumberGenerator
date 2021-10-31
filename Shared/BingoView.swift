//
//  BingoView.swift
//  BingoNumberGenerator
//
//  Created by Tom Cavalli on 9/24/21.
//

import SwiftUI

struct BingoView: View {
    @Binding  var isSelected: [Bool]
    @Binding  var numbers: [Int]
    @Binding  var first  : [Int]
    @Binding  var second : [Int]
    @Binding  var index  :  Int
    @Binding  var timer  :  Bool
    @Binding  var confirm:  Bool
    @Binding  var began  :  Bool
    @Binding  var histogram:  Bool
    @Binding  var memory : [Int]
    @Binding  var counts : [Int]
    @Binding  var game   :  Int
    var body: some View {
        GeometryReader() { geometry in
            VStack(alignment: .center, spacing: geometry.size.height / 32.0 / 5.0) {
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    ZStack {
                        Text(" ")
                            .frame(width: geometry.size.width / 3.0, height: geometry.size.height / 32.0 * 8.0, alignment: .center)
                            .background(Color("TextColor"))
                        Text(" ")
                            .frame(width: geometry.size.width / 3.0 - geometry.size.height / 320.0 , height: geometry.size.height / 32.0 * 8.0 - geometry.size.height / 320.0, alignment: .center)
                            .background(Color("BGColor"))
                        //Big Letter and Number
                        VStack(alignment: .center, spacing: geometry.size.height / 32.0 / 5.0) {
                            Text( index > -1 ? ALetter(i: second[index]) : "B")
                                .frame(width: geometry.size.width * 2.0 / 6.0, height: geometry.size.height / 32.0 * 4.0 , alignment: .center)
                                .font(.system(size: geometry.size.height / 32.0 * 4.0))
                                .foregroundColor(Color.green)
                                .shadow(color: Color("TextColor"), radius: 2.0, x: 2.0, y: 2.0)
                            Text( index > -1 ? "\(second[index])" : "1")
                                .frame(width: geometry.size.width * 2.0 / 6.0, height: geometry.size.height / 32.0 * 4.0, alignment: .center)
                                .font(.system(size: geometry.size.height / 32.0 * 4.0))
                                .foregroundColor(Color.green)
                                .shadow(color: Color("TextColor"), radius: 2.0, x: 2.0, y: 2.0)
                        }
                    }
                    VStack(alignment: .center, spacing: geometry.size.height / 32.0 / 5.0) {
                        Text("Begin by pressing New Game.")
                            .foregroundColor(began ? Color("BGColor") : Color("TextColor"))
                        Spacer()
                        HStack {
                            SmallNumberView(index: index, rank: 0, second: second, geometry: geometry)
                            SmallNumberView(index: index, rank: 1, second: second, geometry: geometry)
                            SmallNumberView(index: index, rank: 2, second: second, geometry: geometry)
                        }
                        Spacer()
                        Text("Number Generator for")
                    }
                    .frame(height: geometry.size.height / 32.0 * 8.0, alignment: .center)
                    Spacer()
                }
                HStack { //Headers
                    Spacer()
                    BigLetterView(aBigLetter: "B", geometry: geometry)
                    BigLetterView(aBigLetter: "I", geometry: geometry)
                    BigLetterView(aBigLetter: "N", geometry: geometry)
                    BigLetterView(aBigLetter: "G", geometry: geometry)
                    BigLetterView(aBigLetter: "O", geometry: geometry)
                    Spacer()
                }
                VStack(alignment: .center, spacing: geometry.size.height / 32.0 / 10 / 5) { // 15 Rows of numbers
                    ForEach((1...15), id: \.self) { i in
                        HStack {
                            ForEach(([0,15,30,45,60]), id: \.self) { j in
                                NumberView(aNumber: i + j, isSelected: $isSelected, geometry: geometry, timer: $timer)
                            }
                        }
                    }
                }
                // Buttons
                HStack(alignment: .center , spacing: 12.0) {
                    Button(confirm ? " Confirm New Game"  : (began) ? " Next Number" : "") {
                        if confirm { //New game:
                            confirm = false
                            began = true
                            numbers.removeAll(keepingCapacity: true)
                            first.removeAll(keepingCapacity: true)
                            second.removeAll(keepingCapacity: true)
                            if counts.count == 0 { counts.append(0) }
                            for i in 1...75 {
                                isSelected[i] = false
                                numbers.append(i)
                                if counts.count < 76 { counts.append(0) }
                            }
                            while numbers.count > 0 {
                                index = Int.random(in: 0...numbers.count - 1)
                                first.append(numbers[index])
                                numbers.remove(at: index)
                            }
                            while first.count > 0 { // double randomize
                                index = Int.random(in: 0...first.count - 1)
                                second.append(first[index])
                                first.remove(at: index)
                            }
                            game -= 1
                            memory.append(game)
                            index = 0
                            isSelected[second[index]] = true
                            memory.append(second[index])
                            counts[second[index]] += 1
                            
                        }else{ //Next Number
                            timer = true
        //timer = false // delete after testing...xyz
                            if index < 73 { // debounce
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.timer = false
                                }
                            }
                            if index < 74 {
                                index += 1
                                isSelected[second[index]] = true
                                memory.append(second[index])
                                counts[second[index]] += 1
                            }
                        }
                    }
                    .frame(height: geometry.size.height / 32.0 * 1.5, alignment:    .center)
                    .background(Color("TextColor"))
                    .foregroundColor(Color("BGColor"))
                    .cornerRadius(6.0)
                    .disabled(timer || ( !confirm && !began ))

                    Button(confirm ? " CANCEL" : " New Game") {
                        timer = false
                        confirm.toggle()
                    }
                    .frame(height: geometry.size.height / 32.0 * 1.5, alignment:    .center)
                    .background(Color("TextColor"))
                    .foregroundColor(Color("BGColor"))
                    .cornerRadius(6.0)
                    Button((memory.count > 0) ? (confirm ? "" : " Histogram") : "") {
                        histogram = true
                    }
                    .frame(height: geometry.size.height / 32.0 * 1.5, alignment:    .center)
                    .background(Color("TextColor"))
                    .foregroundColor(Color("BGColor"))
                    .cornerRadius(6.0)
                    .disabled((memory.count == 0) || confirm)
                }
                Spacer()
            }
            .background(Color("BGColor"))
        }
        
    }
}

func ALetter(i: Int) -> String {
    var a = " "
    if i > -1 {a = "B"}
    if i > 15 {a = "I"}
    if i > 30 {a = "N"}
    if i > 45 {a = "G"}
    if i > 60 {a = "O"}
    return a
}
/*
struct BingoView_Previews: PreviewProvider {
    static var previews: some View {
        BingoView()
    }
}
*/

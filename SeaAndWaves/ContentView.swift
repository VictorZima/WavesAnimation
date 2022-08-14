//
//  ContentView.swift
//  SeaAndWaves
//
//  Created by VictorZima on 12/08/2022.
//

import SwiftUI

struct OptionsForWaves: Hashable {
    let duration: Double
    let opacity: CGFloat
    let amplitude: CGFloat
    let baseHightOffset: CGFloat
    let color: Color
}

struct ContentView: View {
    let options = [
        OptionsForWaves(duration: 5, opacity: 0.4, amplitude: 110, baseHightOffset: 65, color: .red),
        OptionsForWaves(duration: 11, opacity: 0.3, amplitude: 200, baseHightOffset: 70, color: .green),
        OptionsForWaves(duration: 4, opacity: 0.4, amplitude: 200, baseHightOffset: 95, color: .black),
        OptionsForWaves(duration: 11, opacity: 0.3, amplitude: 50, baseHightOffset: 75, color: .blue)
    ]
    let universalSquare = UIScreen.main.bounds
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            
            ForEach(options, id: \.self) { option in
                getWavePath(interval: universalSquare.width * 1.5, amplitude: option.amplitude, baseHight: option.baseHightOffset + (universalSquare.height / 2))
                    .foregroundColor(option.color)
                    .opacity(option.opacity)
                    .offset(x: isAnimated ? -1 * (universalSquare.width * 1.5) : 0)
                    .animation(
                        Animation.linear(duration: option.duration)
                            .repeatForever(autoreverses: false),
                        value: isAnimated
                    )
            }
            
//            getWavePath(interval: universalSquare.width * 1, amplitude: 200, baseHight: 70 + (universalSquare.height / 2))
//                .foregroundColor(
//                    Color.green
//                        .opacity(0.3))
//                .offset(x: isAnimated ? -1 * universalSquare.width : 0)
//                .animation(
//                    Animation.linear(duration: 11)
//                        .repeatForever(autoreverses: false),
//                    value: isAnimated
//                )
//
//            getWavePath(interval: universalSquare.width * 3, amplitude: 200, baseHight: 95 + universalSquare.height / 2)
//                .foregroundColor(
//                    Color.black
//                        .opacity(0.4))
//                .offset(x: isAnimated ? -1 * (universalSquare.width  * 3) : 0)
//                .animation(
//                    Animation.linear(duration: 4)
//                        .repeatForever(autoreverses: false),
//                    value: isAnimated
//                )
//
//            getWavePath(interval: universalSquare.width * 1.2, amplitude: 50, baseHight: 75 + universalSquare.height / 2)
//                .foregroundColor(
//                    Color.blue
//                        .opacity(0.3))
//                .offset(x: isAnimated ? -1 * (universalSquare.width  * 1.2) : 0)
//                .animation(
//                    Animation.linear(duration: 5)
//                        .repeatForever(autoreverses: false),
//                    value: isAnimated
//                )
        }
        .onAppear() {
            self.isAnimated = true
        }
        
        
        
    }
    
    func getWavePath(interval: CGFloat, amplitude: CGFloat = 100, baseHight: CGFloat = UIScreen.main.bounds.height / 2) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 1 * baseHight))
            path.addCurve(
                to: CGPoint(x: 1 * interval, y: baseHight),
                control1: CGPoint(x: interval * 0.35, y: amplitude + baseHight),
                control2: CGPoint(x: interval * 0.65, y: -amplitude + baseHight)
            )
            path.addCurve(
                to: CGPoint(x: 2 * interval, y: baseHight),
                control1: CGPoint(x: interval * 1.35, y: amplitude + baseHight),
                control2: CGPoint(x: interval * 1.65, y: -amplitude + baseHight)
            )
            path.addLine(to: CGPoint(x: 2 * interval, y: universalSquare.height))
            path.addLine(to: CGPoint(x: 0, y: universalSquare.height))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

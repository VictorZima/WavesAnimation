//
//  ContentView.swift
//  SeaAndWaves
//
//  Created by VictorZima on 12/08/2022.
//

import SwiftUI

struct ContentView: View {
    let universalSquare = UIScreen.main.bounds
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            getWavePath(interval: universalSquare.width * 1.5, amplitude: 110, baseHight: 65 + (universalSquare.height / 2))
                .foregroundColor(
                    Color.init(red: 0.2, green: 0.4, blue: 0.7)
                        .opacity(0.4))
                .offset(x: isAnimated ? -1 * (universalSquare.width * 1.5) : 0)
                .animation(
                    Animation.linear(duration: 5)
                        .repeatForever(autoreverses: false),
                    value: isAnimated
                )
            
            getWavePath(interval: universalSquare.width, amplitude: 200, baseHight: 70 + (universalSquare.height / 2))
                .foregroundColor(
                    Color.init(red: 0.3, green: 0.6, blue: 0.4)
                        .opacity(0.4))
                .offset(x: isAnimated ? -1 * universalSquare.width : 0)
                .animation(
                    Animation.linear(duration: 11)
                        .repeatForever(autoreverses: false),
                    value: isAnimated
                )
            
            getWavePath(interval: universalSquare.width * 3, amplitude: 200, baseHight: 95 + universalSquare.height / 2)
                .foregroundColor(
                    Color(.black)
                        .opacity(0.2))
                .offset(x: isAnimated ? -1 * (universalSquare.width  * 3) : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false),
                    value: isAnimated
                )
            
            getWavePath(interval: universalSquare.width * 1.2, amplitude: 50, baseHight: 75 + universalSquare.height / 2)
                .foregroundColor(
                    Color.init(red: 0.6, green: 0.9, blue: 1)
                        .opacity(0.4))
                .offset(x: isAnimated ? -1 * (universalSquare.width  * 1.2) : 0)
                .animation(
                    Animation.linear(duration: 5)
                        .repeatForever(autoreverses: false),
                    value: isAnimated
                )
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

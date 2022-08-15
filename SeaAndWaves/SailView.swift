//
//  SailView.swift
//  SeaAndWaves
//
//  Created by VictorZima on 15/08/2022.
//

import SwiftUI

struct SailView: View {
    var body: some View {
        ZStack() {
            getSailPath()
                .foregroundColor(.blue)
            getSailPath()
                .offset(CGSize(width: 50, height: 50))
                .foregroundColor(.yellow)
                .scaleEffect(CGSize(width: 0.8, height: 0.7))

        }
        .shadow(radius: 15)
    }
    
    func getSailPath() -> Path {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 150))
            path.addCurve(
                to: CGPoint(x: 300, y: 60),
                control1: CGPoint(x: 80, y: 170),
                control2: CGPoint(x: 200, y: 170)
            )
            path.addCurve(
                to: CGPoint(x: 170, y: 600),
                control1: CGPoint(x: 200, y: 220),
                control2: CGPoint(x: 130, y: 300)
            )
            path.addCurve(
                to: CGPoint(x: 50, y: 150),
                control1: CGPoint(x: 25, y: 530),
                control2: CGPoint(x: 40, y: 100)
            )
        }
    }
}

struct SailView_Previews: PreviewProvider {
    static var previews: some View {
        SailView()
    }
}

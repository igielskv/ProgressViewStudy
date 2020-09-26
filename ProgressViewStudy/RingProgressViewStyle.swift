//
//  RingProgressViewStyle.swift
//  ProgressViewStudy
//
//  Created by Manoli on 20/09/2020.
//

import SwiftUI

struct RingProgressViewStyle<S>: ProgressViewStyle where S: ShapeStyle {
    let content: S
    let lineWidth: CGFloat
    let shadowColor: Color
    
    init(content: S, lineWidth: CGFloat = 4.0, shadowColor: Color = Color.clear) {
        self.content = content
        self.lineWidth = lineWidth
        self.shadowColor = shadowColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray).opacity(0.4), style: StrokeStyle(lineWidth: lineWidth))
            
            if let fractionCompleted = configuration.fractionCompleted {
                Circle()
                    .rotation(Angle(degrees: -90.0))
                    .trim(from: 0.0, to: CGFloat(fractionCompleted))
                    .stroke(content, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .shadow(color: shadowColor, radius: lineWidth / 3, x: 0.0, y: lineWidth / 3)
            }
        }
    }
}

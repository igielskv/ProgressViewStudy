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
    
    init(content: S, lineWidth: CGFloat = 4.0) {
        self.content = content
        self.lineWidth = lineWidth
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
            }
        }
    }
}

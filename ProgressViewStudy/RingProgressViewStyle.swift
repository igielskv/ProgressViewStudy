//
//  RingProgressViewStyle.swift
//  ProgressViewStudy
//
//  Created by Manoli on 20/09/2020.
//

import SwiftUI

struct RingProgressViewStyle<S>: ProgressViewStyle where S: ShapeStyle {
    let defaultWidth: CGFloat = 4.0
    
    let content: S
    
    init(content: S) {
        self.content = content
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray).opacity(0.4), style: StrokeStyle(lineWidth: defaultWidth))
            
            if let fractionCompleted = configuration.fractionCompleted {
                Circle()
                    .rotation(Angle(degrees: -90.0))
                    .trim(from: 0.0, to: CGFloat(fractionCompleted))
                    .stroke(content, style: StrokeStyle(lineWidth: defaultWidth, lineCap: .round))
            }
        }
    }
}

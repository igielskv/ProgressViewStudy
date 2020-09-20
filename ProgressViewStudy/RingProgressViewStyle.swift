//
//  RingProgressViewStyle.swift
//  ProgressViewStudy
//
//  Created by Manoli on 20/09/2020.
//

import SwiftUI

struct RingProgressViewStyle: ProgressViewStyle {
    let defaultWidth: CGFloat = 4.0
    let tint: Color
    
    init() {
        tint = Color.accentColor
    }
    
    init(tint: Color) {
        self.tint = tint
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), style: StrokeStyle(lineWidth: defaultWidth))
            
            if let fractionCompleted = configuration.fractionCompleted {
                Circle()
                    .rotation(Angle(degrees: -90.0))
                    .trim(from: 0.0, to: CGFloat(fractionCompleted))
                    .stroke(tint, style: StrokeStyle(lineWidth: defaultWidth, lineCap: .round))
            }
        }
    }
}

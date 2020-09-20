//
//  ContentView.swift
//  ProgressViewStudy
//
//  Created by Manoli on 20/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.2
    
    var body: some View {
        VStack {
            Text("Progress View Styling")
                .padding()
            ProgressView(value: progress)
                .frame(width: 50.0, height: 50.0)
                .onTapGesture {
                    if progress < 1.0 {
                        withAnimation {
                            progress += 0.2
                        }
                    }
                }
                .progressViewStyle(RingProgressViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RingProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), style: StrokeStyle(lineWidth: 4.0))
            
            if let fractionCompleted = configuration.fractionCompleted {
                Circle()
                    .rotation(Angle(degrees: -90.0))
                    .trim(from: 0.0, to: CGFloat(fractionCompleted))
                    .stroke(Color(.systemBlue), style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
            }
        }
    }
}

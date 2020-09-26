//
//  ContentView.swift
//  ProgressViewStudy
//
//  Created by Manoli on 20/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.6
    
    let linearGradient = LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    var body: some View {
        VStack(spacing: 30.0) {
            HStack {
                Text("RingProgressViewStyle")
                
                Spacer()
                
                ProgressView(value: progress)
                    .frame(width: 50.0, height: 50.0)
                    .onTapGesture(perform: makeProgress)
                    .progressViewStyle(RingProgressViewStyle(content: linearGradient, lineWidth: 5.0, shadowColor: Color.purple.opacity(0.5)))
            }
            
            ProgressView("LinearProgressViewStyle", value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .onTapGesture(perform: makeProgress)
            
            Button("Reset") {
                progress = 0.0
            }
        }
        .padding()
    }
    
    func makeProgress() {
        if progress < 1.0 {
            withAnimation {
                progress += 0.1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}

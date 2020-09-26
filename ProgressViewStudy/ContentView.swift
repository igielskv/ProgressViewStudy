//
//  ContentView.swift
//  ProgressViewStudy
//
//  Created by Manoli on 20/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.6
    
    let gradient = Gradient(colors: [.blue, .purple])
    
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    var body: some View {
        VStack(spacing: 30.0) {
            HStack {
                Text("RingProgressViewStyle")
                
                Spacer()
                
                ProgressView(value: progress)
                    .frame(width: 30.0, height: 30.0)
                    .onTapGesture(perform: makeProgress)
                    .progressViewStyle(RingProgressViewStyle(content: Color.accentColor))
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

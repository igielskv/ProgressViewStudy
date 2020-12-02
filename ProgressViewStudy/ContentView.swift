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
                Text("Progress View Study")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Text("My RingProgressViewStyle")
                
                Spacer()
                
                /*
                 
                 RingProgressViewStyle
                 
                 This is custom ProgressViewStyle which substitues Apple's CircularProgressViewStyle with correct behavior. Three arguments are expected where only first 'content' argument is mandatory, the other two are optional.
                 
                 content: has to be type of 'ShapeStyle' (Color or some Gradient would work)
                 
                 lineWidth: of type CGFloat obviously specifies rings line width and it's 4.0 by default
                 
                 shadowColor: of type Color is setting optional shadow Color, default is .clear if omitted
                 
                 */
                
                ProgressView(value: progress)
                    .frame(width: 50.0, height: 50.0)
                    .onTapGesture(perform: makeProgress)
                    .progressViewStyle(RingProgressViewStyle(content: linearGradient, lineWidth: 8.0, shadowColor: Color.purple.opacity(0.5)))
            }
            
            ProgressView("System Default LinearProgressViewStyle", value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .onTapGesture(perform: makeProgress)
            
            HStack {
                Text("Actual 'progress' value: \(progress, specifier: "%0.2f")")
                Spacer()
            }
            
            Button("Reset") {
                progress = 0.0
            }
            
            Spacer()
            
            Text("Tap any ProgressView to \"make\" progress.")
                .font(.footnote)
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
            
    }
}

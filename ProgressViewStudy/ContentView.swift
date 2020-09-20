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
                .frame(width: 200.0, height: 200.0)
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
                .stroke(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Stroke Style@*/Color.blue/*@END_MENU_TOKEN@*/)
        }
    }
}

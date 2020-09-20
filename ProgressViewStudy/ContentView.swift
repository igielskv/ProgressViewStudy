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
        VStack(spacing: 30.0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Progress View Styling")
                        .font(.headline)
                    Text("RingProgressViewStyle()")
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing)
                
                ProgressView(value: progress)
                    .frame(width: 40.0, height: 40.0)
                    .onTapGesture {
                        if progress < 1.0 {
                            withAnimation {
                                progress += 0.2
                            }
                        }
                    }
                    .progressViewStyle(RingProgressViewStyle())
            }
            
            Button("Reset") {
                progress = 0.0
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}

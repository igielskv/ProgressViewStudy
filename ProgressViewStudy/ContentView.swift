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
            Text("Hello, world!")
                .padding()
            ProgressView(value: progress)
                .frame(width: 200.0)
                .onTapGesture {
                    if progress < 1.0 {
                        withAnimation {
                            progress += 0.2
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Mayur Vaity on 03/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //to set background gradient (color)
            //in below example color will strt with blue and wll go to white, these colors to be specified in an array, multiple colors can be used (not just 2)
            //startpoint is from top left (where 1st color willb used), endpt is at bottom-right corner (to end with white)
            //edgesIgnoringSafeArea property used to cover all area and not just safe area of the screen
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), 
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                //each modifier (.property) wraps this view into another view
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

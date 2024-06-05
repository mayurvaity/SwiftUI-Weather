//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Mayur Vaity on 05/06/24.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        //clipshape - to set cornerradius with value 10
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient) //adding .gradient to change button color
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WeatherButton(title: "Test title",
                  textColor: .white,
                  backgroundColor: .blue)
}

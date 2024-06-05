//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Mayur Vaity on 03/06/24.
//

import SwiftUI

struct ContentView: View {
    
    //to keep night or day value
    //in swiftUI, states gets created and destroyed all the time, but this state property gets stored somewhere else to preserve its value
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            //to set background gradient (color)
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                //spacing - to add space between each weather day view
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                
                //spacer to hold above stuff to the top of the screen, add new content above
                Spacer()
                
                //button view
                //1st section is for action after pressing button
                //label - is for what button looks like
                Button {
                    //this block to contain action when button is pressed
                    print("tapped")
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backgroundColor: .mint)
                }
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

//video done till 28:50

//a way of reading it - this view has a body and it returns a view
struct WeatherDayView: View {
    //creating variables, to make this view/struct reusable
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            //symbolRenderingMode - for accessing rendering modes made by SF symbol 3+
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.pink, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundStyle(Color(.white))
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
    
        //to set background gradient (color)
        //in below example color will strt with blue and wll go to custom color (lightBlue), these colors to be specified in an array, multiple colors can be used (not just 2)
        //startpoint is from top left (where 1st color willb used), endpt is at bottom-right corner (to end with white)
        //edgesIgnoringSafeArea property used to cover all area and not just safe area of the screen
        //to use color from assets, use name string with struct Color
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea(.all)
        
        //another way of implementing gradient - iOS 16+
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        //each modifier (.property) wraps this view into another view
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        //spacing - to adjust space between subviews within it
        //padding (modf) - to add padding to vstack (in this case, below)
        VStack(spacing: 10) {
            //Image - to add SF symbo
            //renderingMode - to specify coloring
            //resizable - to fix size
            //aspectratio - to maintain original image aspects
            //frame - to surround this view (image) with another frame image, to limit width and height
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            //temperature value text
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}



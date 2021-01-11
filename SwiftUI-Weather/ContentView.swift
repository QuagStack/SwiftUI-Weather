//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Dillon Willis on 1/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(city:"Billings, MT")
                
                MainWeatherStatusView(imageName:  isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 74)
                
                
                HStack(spacing: 15){
                    WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "MON", imageName: "sun.max.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sunset.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 20)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 22)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 74)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label : {
                    WeatherButton(title: "Change Time of Day", backGroundColor: .white, textColor: .blue)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight : .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium ))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var city : String;
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName : String;
    
    var temp : Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium ))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


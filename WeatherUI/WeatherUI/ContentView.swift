//
//  ContentView.swift
//  WeatherUI
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: self.$isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(temperature: 76, imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill")

                HStack(spacing: 20) {
                    WeatherDayView(day: "TUE", temperature: 74, imageName: "cloud.sun.fill")
                    WeatherDayView(day: "WED", temperature: 88, imageName: "sun.max.fill")
                    WeatherDayView(day: "THU", temperature: 55, imageName: "wind.snow")
                    WeatherDayView(day: "FRI", temperature: 60, imageName: "sunset.fill")
                    WeatherDayView(day: "SAT", temperature: 25, imageName: "snow")
                }
                
                Spacer()
                
                Button {
                    self.isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
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
    var day: String
    var temperature: Int
    var imageName: String
    
    var body: some View {
        VStack {
            Text(self.day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: self.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(self.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [self.isNight ? .black : .blue, self.isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(self.cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var temperature: Int
    var imageName: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: self.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(self.temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

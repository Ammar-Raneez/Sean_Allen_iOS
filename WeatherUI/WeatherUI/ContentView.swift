//
//  ContentView.swift
//  WeatherUI
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    private let weatherData: [WeatherModel] = [
        WeatherModel(day: Day.Tue.rawValue, temperature: 74, imageName: Icon.CloudSun.rawValue),
        WeatherModel(day: Day.Wed.rawValue, temperature: 88, imageName: Icon.sunMax.rawValue),
        WeatherModel(day: Day.Thu.rawValue, temperature: 55, imageName: Icon.windSnow.rawValue),
        WeatherModel(day: Day.Fri.rawValue, temperature: 60, imageName: Icon.sunset.rawValue),
        WeatherModel(day: Day.Sat.rawValue, temperature: 25, imageName: Icon.snow.rawValue)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: self.$isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(temperature: 76, imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill")

                HStack(spacing: 20) {
                    ForEach(weatherData) {
                        i in WeatherDayView(
                            day: i.day,
                            temperature: i.temperature,
                            imageName: i.imageName
                        )
                    }
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

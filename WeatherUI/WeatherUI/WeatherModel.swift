//
//  WeatherModel.swift
//  WeatherUI
//
//  Created by Ammar on 2023-02-26.
//

import Foundation

struct WeatherModel: Identifiable {
    let day: String
    let temperature: Int
    let imageName: String
    let id = UUID()
}

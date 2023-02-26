//
//  WeatherButton.swift
//  WeatherUI
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(self.title)
            .frame(width: 280, height: 50)
            .background(self.backgroundColor)
            .foregroundColor(self.textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

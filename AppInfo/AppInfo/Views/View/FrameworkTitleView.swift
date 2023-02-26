//
//  FrameworkTitieView.swift
//  AppInfo
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(self.framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(self.framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
}


struct FrameworkTitieView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}

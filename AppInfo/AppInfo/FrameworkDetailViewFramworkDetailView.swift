//
//  FramworkDetailView.swift
//  AppInfo
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }

            Spacer()

            FrameworkTitleView(framework: self.framework)
            Text(self.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                
            } label: {
                AFButton(title: "Learn More")
            }
        }
    }
}

struct FramworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FramworkDetailView(framework: MockData.sampleFramework)
    }
}

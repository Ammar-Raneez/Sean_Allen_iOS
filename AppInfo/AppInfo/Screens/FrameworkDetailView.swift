//
//  FramworkDetailView.swift
//  AppInfo
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    var showDismiss: Bool = true
    
    // Bindings are needed to update
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            if showDismiss {
                XDismissButton(isShowingDetailView: $isShowingDetailView)
            }
            Spacer()

            FrameworkTitleView(framework: self.framework)
            Text(self.framework.description)
                .font(.body)
                .padding()

            Spacer()

            Button {
                self.isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: self.$isShowingSafariView, content: {
            SafariView(url: URL(string: self.framework.urlString)!)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}

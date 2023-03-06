//
//  FramworkDetailView.swift
//  AppInfo
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct FrameworkDetailView: View {
    var showDismiss: Bool = true
    
    // use observed object when passing down a stateobject from parent
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
//    var framework: Framework
//    // Bindings are needed to update
//    @Binding var isShowingDetailView: Bool
//    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            if showDismiss {
                XDismissButton(isShowingDetailView:
                                // Extract value from Binding<bool>
                                $viewModel.isShowingDetailView.wrappedValue)
            }
            Spacer()

            FrameworkTitleView(framework: viewModel.framework)
            Text(viewModel.framework.description)
                .font(.body)
                .padding()

            Spacer()

            Button {
                viewModel.isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $viewModel.isShowingSafariView, content: {
            SafariView(url: URL(string: viewModel.framework.urlString)!)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(true)))
    }
}

//
//  ContentView.swift
//  AppInfo
//
//  Created by Ammar on 2023-02-26.
//

import SwiftUI

struct FrameworkListView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    // Lists have their own navigation handler
                    NavigationLink(
                        destination:                     FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView))
                    ) {
                        FrameworkTitleView(
                            framework: framework,
                            orientation: "h",
                            width: 70,
                            height: 70
                        )
                    }
                }
                .navigationTitle("Apple Frameworks")
            }
        }.accentColor(Color(.label))
    }
}

struct FrameworkListView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}

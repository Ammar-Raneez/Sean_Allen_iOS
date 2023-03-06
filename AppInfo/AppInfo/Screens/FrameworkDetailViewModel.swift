//
//  FrameworkDetailViewModel.swift
//  AppInfo
//
//  Created by Ammar on 2023-03-06.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    var framework: Framework
    
    // Sending down bindings require this syntax
    var isShowingDetailView: Binding<Bool>
    @Published var isShowingSafariView: Bool = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}

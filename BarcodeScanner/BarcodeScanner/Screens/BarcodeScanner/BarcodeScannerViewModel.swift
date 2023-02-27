//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Ammar on 2023-02-27.
//

import SwiftUI

// Just to follow the MVVM design pattern. Move logic here
final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode: String = ""
    @Published var alertItem: AlertItem?
    
    // Computed properties
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}

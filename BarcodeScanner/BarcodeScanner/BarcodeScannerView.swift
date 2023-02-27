//
//  BarcodeScannerView.swift
//  BarcodeScanner
//
//  Created by Ammar on 2023-02-27.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: self.$scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanner Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(self.scannedCode.isEmpty ? "Not Yet Scanned" : self.scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(self.scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

struct BarcodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}

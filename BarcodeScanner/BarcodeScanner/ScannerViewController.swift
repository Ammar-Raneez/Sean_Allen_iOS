//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Ammar on 2023-02-27.
//

import UIKit
import AVFoundation

enum CameraError: String {
    case invalidDeviceInput = "Something is wrong with the camera. We are unable to capture the input"
    case invalidScannedValue = "The value scanned is not valid. This app scans EAN-8 and EAN-13."
}

protocol ScannerViewControllerDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
}

final class ScannerViewController: UIViewController {
    // load of
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerViewControllerDelegate?
    
    init(scannerDelegate: ScannerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    // Handle case of trying to load into storyboard
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }

        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidDeviceInput)
            return
        }
        
        // Add input
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            self.scannerDelegate?.didSurface(error: CameraError.invalidDeviceInput)
            return
        }

        if self.captureSession.canAddInput(videoInput) {
            self.captureSession.addInput(videoInput)
        } else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidDeviceInput)
            return
        }
        
        // Add output
        let metadataOutput = AVCaptureMetadataOutput()

        if self.captureSession.canAddOutput(metadataOutput) {
            self.captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            // Standard 8 digit or 13 digit barcodes
            metadataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidDeviceInput)
            return
        }

        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        guard case self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidDeviceInput)
            return
        }

        view.layer.addSublayer(previewLayer!)
        self.captureSession.startRunning()
    }
}

// Conform to protocol as required in metadataOutput.setMetadataObjectsDelegate
extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidScannedValue)
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidScannedValue)
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            self.scannerDelegate?.didSurface(error: CameraError.invalidScannedValue)
            return
        }

        // Normally, it continuously scans, and spits out the value multiple times. This stops once the value is read once
        // self.captureSession.stopRunning()

        // Finally found a barcode
        scannerDelegate?.didFind(barcode: barcode)
    }
}

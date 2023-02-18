//
//  CWButton.swift
//  CardWorkoutRaw
//
//  Created by Ammar on 2023-02-18.
//

import UIKit

class CWButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Every subclass will require this
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String, systemImage: String) {
        // Lay using constraints without frames
        super.init(frame: .zero)
        
        // ios 15+
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseForegroundColor = backgroundColor
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.cornerStyle = .medium
        configuration?.image = UIImage(systemName: systemImage)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .leading
        translatesAutoresizingMaskIntoConstraints = false
    }
}

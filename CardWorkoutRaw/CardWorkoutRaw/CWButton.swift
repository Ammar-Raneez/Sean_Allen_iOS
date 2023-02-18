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
        self.configure()
    }
    
    // Every subclass will require this
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        // Lay using constraints without frames
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        
        // Use auto layout
        translatesAutoresizingMaskIntoConstraints = false
    }
}

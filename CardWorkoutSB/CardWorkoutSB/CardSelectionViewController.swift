//
//  CardSelectionViewController.swift
//  CardWorkoutSB
//
//  Created by Ammar on 2023-02-18.
//

import UIKit

class CardSelectionViewController: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in self.buttons {
            button.layer.cornerRadius = 8
        }
    }

    @IBAction func stopButtontapped(_ sender: UIButton) {
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
    }
}

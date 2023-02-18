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
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startTimer()
    }
    
    // Once view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer.invalidate()
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        self.cardImageView.image = self.cards.randomElement() ?? UIImage(named: "AS")
    }

    @IBAction func stopButtontapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        self.startTimer()
    }
}

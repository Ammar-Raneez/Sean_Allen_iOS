//
//  ColorsDetailsViewController.swift
//  ColorsApp
//
//  Created by Ammar on 2023-02-18.
//

import UIKit

class ColorsDetailsViewController: UIViewController {
    var color: UIColor?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
        // Do any additional setup after loading the view.
    }
}

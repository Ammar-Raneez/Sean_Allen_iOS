//
//  ColorsTableViewController.swift
//  ColorsApp
//
//  Created by Ammar on 2023-02-18.
//

import UIKit

class ColorsTableViewController: UIViewController {
    var colors: [UIColor] = []
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toDetail = "ToColorDetails"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue.destination is of type ViewController, we need it to be as our custom ViewController
        let destVC = segue.destination as! ColorsDetailsViewController
        destVC.color = sender as? UIColor
    }
    
    func addRandomColors() {
        for _ in 0...50 {
            colors.append(.random())
        }
    }
}

extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}

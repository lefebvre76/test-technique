//
//  DetailViewController.swift
//  test-technique
//
//  Created by Loïc Levebvre on 23/09/2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    
    var episode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NameLabel.text = episode?.name
    }
}

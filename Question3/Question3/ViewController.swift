//
//  ViewController.swift
//  Question3
//
//  Created by Tarik Efe on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.getRandomQuotes { quotesRandom, error in
            guard let quotes = quotesRandom else { return }
            self.randomLabel.text = "\(quotes)"
        }
        
    }
    
    @IBAction func randomButton(_ sender: Any) {
        Network.getRandomQuotes { quotesRandom, error in
            guard let quotes = quotesRandom else { return }
            self.randomLabel.text = "\(quotes)"
        }
    }
}


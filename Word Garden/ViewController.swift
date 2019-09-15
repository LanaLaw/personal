//
//  ViewController.swift
//  Word Garden
//
//  Created by Ellana Lawrence on 9/14/19.
//  Copyright © 2019 Ellana Lawrence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In viewDidLoad, is guessLetterField the first responder?", guessLetterField.isFirstResponder)
        // Do any additional setup after loading the view.
    }

    func updateUIAfterGuess() {
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
    }
    
    
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    
    
    
}


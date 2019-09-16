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
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuesssesRemaining = 8
    var guessCount = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        print("In viewDidLoad, is guessLetterField the first responder?", guessLetterField.isFirstResponder)
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
     
        // Do any additional setup after loading the view.
    }

    func updateUIAfterGuess() {
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    func formatUserGuessLabel(){
        var revealedWord = ""
        
        lettersGuessed += guessLetterField.text!
        // revealedWord should now equal: "_ _ _ _ _"
        //WHY DOES THIS WORK?
        
        for letter in wordToGuess{
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            } // if I guess "S" on the first try, why does the "else" part still run?
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1
        
        //decrements the wrongGuessesRemaining and shows the next flower image with one less pedal
        let currentLetterGuessed = guessLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuesssesRemaining = wrongGuesssesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuesssesRemaining)")
        }
        
        
        let revealedWord = userGuessLabel.text!
        //stop guesses if wrongGuessesRemaining = 0
        if wrongGuesssesRemaining == 0 {
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, you're all out of guesses. Try again?"
        } else if !revealedWord.contains("_") {
            //You've won
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            //Update guess count
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
            

//            var guess = "guesses"
//            if guessCount == 1 {
//                guess = "guess"
            
            
            guessCountLabel.text = "You've Made \(guessCount) \(guess)"
            
        }
        
    }
    

    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessLetterField.text?.last{
            guessLetterField.text = String(letterGuessed)
            guessLetterButton.isEnabled = true
        } else {
            //disable the button if I don't have a single character in the guessLetterField
            guessLetterButton.isEnabled = false
        }
    }
    
    
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage (named: "flower8")
        wrongGuesssesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
    
    
}


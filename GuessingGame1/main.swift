//
//  main.swift
//  GuessingGame1
//
//  Created by Matthew Riley on 8/18/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

var playAgain = false

// Game repeat
repeat {
    
    let randomNumber = Int(arc4random_uniform(100)) + 1
    var numberOfTries = 5
    var guessedNumber: Int? = nil
    
    print("Guess a number between 1 and 100:")
    
    // Guess repeat
    repeat {
        // Validation repeat
        repeat {
            
            let input = readLine()!
            
            if input == "Wendy" {
                print("You have unlocked the answer: \(randomNumber)")
            }
            
            if let inputAsANumber = Int(input) {
                if inputAsANumber >= 1 && inputAsANumber <= 100 {
                    guessedNumber = inputAsANumber
                } else {
                    print("Please enter a number between 1 and 100")
                    guessedNumber = nil
                }
            } else {
                print("Please enter number")
                guessedNumber = nil
            }
        } while guessedNumber == nil
        
        guard let guessedNumber = guessedNumber else {
            fatalError()
        }
        
        if guessedNumber == randomNumber {
            print("YOU WON!!!")
        } else if guessedNumber > randomNumber {
            numberOfTries -= 1
            print("Guess Lower. You have \(numberOfTries) guesses left")
        } else if guessedNumber < randomNumber {
            numberOfTries -= 1
            print("Guess Higher. You have \(numberOfTries) guesses left")
        }
    } while guessedNumber != randomNumber && numberOfTries > 0
    
    if numberOfTries == 0 {
        print("GAME OVER!!! The answer was \(randomNumber).")
    }
    
    print("Play again? Yes: Y or No: N")
    
    let input = readLine()!
    
    if input.lowercased() == "y" {
        playAgain = true
    } else {
        playAgain = false
    }
    
    // short form
    //    playAgain = input.lowercased() == "y"
    
} while playAgain

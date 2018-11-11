//
//  ViewController.swift
//  Flashcards
//
//  Created by Fatima A on 10/13/18.
//  Copyright © 2018 Fatima Ali. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var AnsLabel: UILabel!
    @IBOutlet weak var QuestLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    // create an array to hold our flashcards
    var flashcards = [Flashcard]() // create an array of object type Flashcard structs
    var currentIndex = 0 // array index for Flashcards array
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            // inside this block, we know we def have a dictionary Array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            // add all of these cards into the Flashcarda array
            flashcards.append(contentsOf: savedCards)
            
        }
    }
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        QuestLabel.text = flashcard.question
        AnsLabel.text = flashcard.answer
        flashcards.append(flashcard)
        
        // Logging to the console
        print("😎 Added new flashcard!")
        
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
        print("😎 We now have \(flashcards.count) flashcards")
        saveAllFlashcardsToDisk()

        updateNextPrevButtons()
        
        updateLabels()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.cornerRadius = 20.0
        
        AnsLabel.layer.cornerRadius = 20.0
        AnsLabel.clipsToBounds = true
        
        QuestLabel.layer.cornerRadius = 20.0
        QuestLabel.clipsToBounds = true
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
         //   updateFlashcard(question: "What are the three components of the exposure triangle?", answer: "Shutter speed, aperture, and ISO")
            updateFlashcard(question: "What are the three components of the exposure triangle?", answer: "Shutter speed, aperture, and ISO")
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //QuestLabel.isHidden = false;

         if (QuestLabel.isHidden){// if QuestLabel is hidden, make it visible. otherwise, hide it.
         QuestLabel.isHidden = false;
         }
         else{
         QuestLabel.isHidden = true;
         }
      
    }

    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex -= 1
        // update labels
        updateLabels()
        
        // update buttons
        updateNextPrevButtons()
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        // update currentIndex
        currentIndex += 1
        
        // update labels
        updateLabels()
        
        // update buttons
        updateNextPrevButtons()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // make destination of segue bc the nav controller
        let navigationController = segue.destination as! UINavigationController
        // make nav controller only contain a creation view controller
        let creationController = navigationController.topViewController as! CreationViewController
        // set flashcardsController property to self
        creationController.flashcardsController = self
    
    }
    
    func updateNextPrevButtons() {
        // Disable the next button if user is looking at the last card in the array
        if currentIndex == flashcards.count - 1 {// at index of last struct in the array
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // Disable previous button if at the beginning
        if currentIndex == 0 {// at index of last struct in the array
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
        
    }
    
    func updateLabels() {
        
        // get the current flashcard that the user is on
        let currentFlashcard = flashcards[currentIndex]
        
        // update the labels that the user may view
        QuestLabel.text = currentFlashcard.question
        AnsLabel.text = currentFlashcard.answer
    }
    
    func saveAllFlashcardsToDisk() {
        //UserDefaults.standard.set(flashcards, forKey: "flashcards")
        
       // make a dictionary array from the Flashcard array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer] // return a dictionary
        }
        // Save the array onto the disk, using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        // Log the changes
        print("Woohoo! Flashcards saved to UserDefaults")
    }
}


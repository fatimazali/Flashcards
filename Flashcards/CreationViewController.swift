//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Fatima A on 10/27/18.
//  Copyright © 2018 Fatima Ali. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    @IBOutlet weak var questTextField: UITextField!
    @IBOutlet weak var ansTextField: UITextField!
    
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didTapOnDone(_ sender: Any) {
        let questText = questTextField.text
        let answerText = ansTextField.text
        // Call function to update flashcard
        flashcardsController.updateFlashcard(question: questText!, answer: answerText!)
        
        // call Dismiss function to get back to the screen that displays flashcards
        dismiss(animated: true)
        
        
        
    }
    
}

//
//  ViewController.swift
//  Flashcards
//
//  Created by Fatima A on 10/13/18.
//  Copyright © 2018 Fatima Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var AnsLabel: UILabel!
    @IBOutlet weak var QuestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.cornerRadius = 20.0
        
        AnsLabel.layer.cornerRadius = 20.0
        AnsLabel.clipsToBounds = true
        
        QuestLabel.layer.cornerRadius = 20.0
        QuestLabel.clipsToBounds = true
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if (QuestLabel.isHidden){// if QuestLabel is hidden, make it visible. otherwise, hide it.
            QuestLabel.isHidden = false;
        }
        else{
            QuestLabel.isHidden = true;
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        
        QuestLabel.text = question
        AnsLabel.text = answer
            
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // make destination of segue bc the nav controller
        let navigationController = segue.destination as! UINavigationController
        // make nav controller only contain a creation view controller
        let creationController = navigationController.topViewController as! CreationViewController
        // set flashcardsController property to self
        creationController.flashcardsController = self
    
    }
    
    
}


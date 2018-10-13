//
//  ViewController.swift
//  Flashcards
//
//  Created by Fatima A on 10/13/18.
//  Copyright © 2018 Fatima Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var AnsLabel: UILabel!
    @IBOutlet weak var QuestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        QuestLabel.isHidden = true;
    }
    

}


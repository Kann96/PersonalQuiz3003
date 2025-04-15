//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var zooNameLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var resultZoo: [Answer]!
    var numberOfAnimals = [Animal: Int]()
    var winningAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        for result in resultZoo {
            if let currentCount = numberOfAnimals[result.animal] {
                numberOfAnimals[result.animal] = currentCount + 1
            } else {
                numberOfAnimals[result.animal] = 1
            }
        }
        if let maxCount = Array(numberOfAnimals.values).max(),
        let firstMax = numberOfAnimals.first(where:{ $0.value == maxCount }) {
            winningAnimal = firstMax.key
        }
        zooNameLabel.text = "Вы - \(winningAnimal?.rawValue ?? "🦄")"
        resultLabel.text = winningAnimal?.definition
    }
   
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
}

//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var starWarsOne: UIImageView!
    @IBOutlet weak var starWarsTwo: UIImageView!
    @IBOutlet weak var starWarsThree: UIImageView!
    @IBOutlet weak var starWarsFour: UIImageView!
    
    @IBOutlet weak var starTrekOne: UIImageView!
    @IBOutlet weak var starTrekTwo: UIImageView!
    @IBOutlet weak var starTrekThree: UIImageView!
    @IBOutlet weak var starTrekFour: UIImageView!
    
    var starWarsCharacter: UIImageView!
    var starTrekCharacter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStarWarsGestureRecognizers()
        setupStarTrekGestureRecognizers()
    }
    
    func setupStarWarsGestureRecognizers() {
        let imageViews = [starWarsOne, starWarsTwo, starWarsThree, starWarsFour]
        
        for imageview in imageViews {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starwarsCharacterChosen))
            gestureRecognizer.numberOfTapsRequired = 1
            imageview?.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    func setupStarTrekGestureRecognizers() {
        let imageViews = [starTrekOne, starTrekTwo, starTrekThree, starTrekFour]
        
        for imageview in imageViews {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starTrekCharacterChosen))
            gestureRecognizer.numberOfTapsRequired = 1
            imageview?.isUserInteractionEnabled = true
            imageview?.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! FightVC
        destVC.starWarsImage = starWarsCharacter.image
        destVC.starTrekImage = starTrekCharacter.image
    }
    
}

extension ViewController {
    
    func starwarsCharacterChosen(_ sender: UITapGestureRecognizer) {
        if starWarsCharacter != nil { starWarsCharacter.layer.borderWidth = 0.0 }
        let chosenImageView = sender.view as! UIImageView
        chosenImageView.layer.borderWidth = 2.0
        chosenImageView.layer.borderColor = UIColor.green.cgColor
        starWarsCharacter = chosenImageView
        checkForFight()
    }
    
    func starTrekCharacterChosen(_ sender: UITapGestureRecognizer) {
        if starTrekCharacter != nil { starTrekCharacter.layer.borderWidth = 0.0 }
        let chosenImageView = sender.view as! UIImageView
        chosenImageView.layer.borderWidth = 2.0
        chosenImageView.layer.borderColor = UIColor.green.cgColor
        starTrekCharacter = chosenImageView
        checkForFight()
    }
    
    func checkForFight() {
        if starWarsCharacter != nil && starTrekCharacter != nil {
            performSegue(withIdentifier: "fightSegue", sender: nil)
        }
    }

}

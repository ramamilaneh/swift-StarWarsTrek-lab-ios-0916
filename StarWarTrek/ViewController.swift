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
        starWarsGestureRecognizer()
        starTrekGestureRecognizer()
    }
    
    func starWarsGestureRecognizer() {
        let imageViews = [starWarsOne, starWarsTwo, starWarsThree, starWarsFour]
        for image in imageViews {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starWarsSelector))
            image?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    func starWarsSelector(_ sender: UITapGestureRecognizer) {
        
        if starWarsCharacter == nil {
            starWarsCharacter = sender.view as! UIImageView!
            starWarsCharacter.layer.borderWidth = 10
            starWarsCharacter.layer.borderColor = UIColor.green.cgColor
        }   else {
            starWarsCharacter.layer.borderWidth = 0
            starWarsCharacter = sender.view as! UIImageView!
            starWarsCharacter.layer.borderWidth = 10
            starWarsCharacter.layer.borderColor = UIColor.green.cgColor
        }
        
        print(starWarsCharacter.tag)
        if starWarsCharacter != nil && starTrekCharacter != nil {
            performSegue(withIdentifier: "showDetail", sender: nil)
        }
    }
    


    func starTrekGestureRecognizer() {
        let imageViews = [starTrekOne, starTrekTwo, starTrekThree, starTrekFour]
        for image in imageViews {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starTrekSelector))
            image?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    func starTrekSelector(_ sender: UITapGestureRecognizer) {
        
        if starTrekCharacter == nil {
            starTrekCharacter = sender.view as! UIImageView!
            starTrekCharacter.layer.borderWidth = 10
            starTrekCharacter.layer.borderColor = UIColor.green.cgColor
        }   else {
            starTrekCharacter.layer.borderWidth = 0
            starTrekCharacter = sender.view as! UIImageView!
            starTrekCharacter.layer.borderWidth = 10
            starTrekCharacter.layer.borderColor = UIColor.green.cgColor
        }
        
        print(starTrekCharacter.tag)
        
        if starWarsCharacter != nil && starTrekCharacter != nil {
        performSegue(withIdentifier: "showDetail", sender: nil)
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
                let dest = segue.destination as! FightViewController
                dest.starWarsCharacter = starWarsCharacter
                dest.starTrekCharacter = starTrekCharacter
        }
    }
    
    
    
    
 
}



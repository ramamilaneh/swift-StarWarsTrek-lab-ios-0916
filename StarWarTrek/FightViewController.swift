//
//  FightViewController.swift
//  StarWarTrek
//
//  Created by Alexander Mason on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {

    @IBOutlet weak var starWarsImage: UIImageView!
    
    @IBOutlet weak var starTrekImage: UIImageView!
    
    var starWarsCharacter: UIImageView! = nil
    var starTrekCharacter: UIImageView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsImage.image = starWarsCharacter.image
        starTrekImage.image = starTrekCharacter.image
        // Do any additional setup after loading the view.
        
        let characterArray = [starWarsImage, starTrekImage]
        
        for image in characterArray {
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(moveCharacters))
        image?.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    func moveCharacters(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        let imageMove = sender.view
        imageMove?.center = point
        self.view.bringSubview(toFront: imageMove!)
        intersects()
    }
    
    func intersects() {
        if starWarsImage.frame.intersects(starTrekImage.frame) {
            view.backgroundColor = UIColor.getRandomColor()
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIColor {
    class func getRandomColor() -> UIColor {
        // var color: UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        
        
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

//
//  FightVC.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FightVC: UIViewController {
    @IBOutlet weak var starWarsImageView: UIImageView!
    @IBOutlet weak var starTrekImageView: UIImageView!
    
    var starWarsImage: UIImage!
    var starTrekImage: UIImage!
    
    let randomColors: [UIColor] = [.blue, .gray, .green, .red, .purple, .black]

    override func viewDidLoad() {
        super.viewDidLoad()
        starTrekImageView.image = starTrekImage
        starWarsImageView.image = starWarsImage
        
        let starTrekPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didMoveStarTrek))
        starTrekImageView.addGestureRecognizer(starTrekPanGestureRecognizer)
        
        let starWarsPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didMoveStarWars))
        starWarsImageView.addGestureRecognizer(starWarsPanGestureRecognizer)
    }
    
    func didMoveStarTrek(_ sender: UIPanGestureRecognizer) {
        let imageview = sender.view as! UIImageView
        let point = sender.location(in: view)
        imageview.center = point
        collision()
        
    }
    
    func didMoveStarWars(_ sender: UIPanGestureRecognizer) {
        let imageview = sender.view as! UIImageView
        let point = sender.location(in: view)
        imageview.center = point
        collision()
    }
    
    
    func collision() {
        if (starWarsImageView.frame.intersects(starTrekImageView.frame)) {
            let randomIndex = Int(arc4random_uniform(UInt32(randomColors.count)))
            let color = randomColors[randomIndex]
            view.backgroundColor = color
        }
    }
    
    

}

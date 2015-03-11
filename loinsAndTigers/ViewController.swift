//
//  ViewController.swift
//  loinsAndTigers
//
//  Created by terry atkins on 10/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
   var myTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myImageView.image = myTiger.image
        nameLabel.text = "Name: \(myTiger.name)"
        ageLabel.text = "Age: \(myTiger.age)"
        breedLabel.text = "Breed: \(myTiger.breed)"
        
        var myTiger2 = Tiger()
        myTiger2.name = "Tigress"
        myTiger2.age = 2
        myTiger2.breed = "Indochinese Tiger"
        myTiger2.image = UIImage(named: "IndochineseTiger.jpg")
        
        myImageView.image = myTiger2.image
        nameLabel.text = "Name: \(myTiger2.name)"
        ageLabel.text = "Age: \(myTiger2.age)"
        breedLabel.text = "Breed: \(myTiger2.breed)"
        
        var myTiger3 = Tiger()
        myTiger3.name = "Jacob"
        myTiger3.age = 4
        myTiger3.breed = "Malayan Tiger"
        myTiger3.image = UIImage(named: "MalayanTiger.jpg")
        
        myImageView.image = myTiger3.image
        nameLabel.text = "Name: \(myTiger3.name)"
        ageLabel.text = "Age: \(myTiger3.age)"
        breedLabel.text = "Breed: \(myTiger3.breed)"
        
        myTigers += [myTiger, myTiger2, myTiger3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonOnPress(sender: UIBarButtonItem) {
        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        let tiger = myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

}

































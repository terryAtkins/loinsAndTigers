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
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    
    var currentIndex = 0
    var currentAnimal = (species: "Tiger", index: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var currentAnimal = (species: "Tiger", index: 0)
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTiger.age = myTiger.multiplyTigerAge(myTiger.age)
        self.randomFactLabel.text = myTiger.randomFact()
        
        
        myImageView.image = myTiger.image
        nameLabel.text = "Name: \(myTiger.name)"
        ageLabel.text = "Age: \(myTiger.age)"
        breedLabel.text = "Breed: \(myTiger.breed)"
        
        var myTiger2 = Tiger()
        myTiger2.name = "Tigress"
        myTiger2.age = 2
        myTiger2.breed = "Indochinese Tiger"
        myTiger2.image = UIImage(named: "IndochineseTiger.jpg")
        myTiger2.age = myTiger2.multiplyTigerAge(myTiger2.age)
        
        
        myImageView.image = myTiger2.image
        nameLabel.text = "Name: \(myTiger2.name)"
        ageLabel.text = "Age: \(myTiger2.age)"
        breedLabel.text = "Breed: \(myTiger2.breed)"
        
        var myTiger3 = Tiger()
        myTiger3.name = "Jacob"
        myTiger3.age = 4
        myTiger3.breed = "Malayan Tiger"
        myTiger3.image = UIImage(named: "MalayanTiger.jpg")
        myTiger3.age = myTiger3.multiplyTigerAge(myTiger3.age)
        
        
        myImageView.image = myTiger3.image
        nameLabel.text = "Name: \(myTiger3.name)"
        ageLabel.text = "Age: \(myTiger3.age)"
        breedLabel.text = "Breed: \(myTiger3.breed)"
        
        self.myTigers += [myTiger, myTiger2, myTiger3]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named:"Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        lion.changeToAlphaMale()
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale  = true
        
        var femaleLionCub = LionCub()
        femaleLionCub.name = "Nala"
        femaleLionCub.age = 1
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonOnPress(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()

        
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            self.currentAnimal = ("Lion", randomIndex)
        case ("Lion", _) :
                let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
                self.currentAnimal = ("LionCub", randomIndex)
        default :
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            self.currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView() {
    
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = "Breed: \(tiger.breed)"
                self.ageLabel.text = "Age: \(tiger.age)"
                self.nameLabel.text = "Name: \(tiger.name)"
                self.randomFactLabel.text = "Fun fact: \(tiger.randomFact())"
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = "Breed: \(lion.subspecies)"
                self.ageLabel.text = "Age: \(lion.age)"
                self.nameLabel.text = "Name: \(lion.name)"
                self.randomFactLabel.text = "Fun fact: \(lion.randomFact())"
            }
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = "Breed: \(lionCub.subspecies)"
                self.ageLabel.text = "Age: \(lionCub.age)"
                self.nameLabel.text = "Name: \(lionCub.name)"
                self.randomFactLabel.text = "Fun fact: \(lionCub.randomFact())"
            }
            self.randomFactLabel.hidden = false
            }, completion: {
                (finished: Bool) -> () in
        })
    
    }

}

































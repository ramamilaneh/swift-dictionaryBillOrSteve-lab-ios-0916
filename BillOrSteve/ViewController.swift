//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your instance variables here
    var factsAboutSteveAndBill: [String : [String]] = [:]
    var nameOfThePerson:String=""
    var count=0
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var fact: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createFacts()
        score.text="0"
        showFact()
    }
    
    
    @IBAction func Steve(sender: AnyObject) {
        if(nameOfThePerson=="Steve Jobs"){
            count += 1
            score.text=String(count)
            
        }
        showFact()
    }
    
    
    @IBAction func Bill(sender: AnyObject) {
        if(nameOfThePerson=="Bill Gates"){
            count += 1
            score.text=String(count)
            
        }
        showFact()
    }
    
    
    
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        
        return Int(arc4random_uniform(UInt32(number)))
        
    }
    
    func randomPerson() -> String {
        
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
        
    }
    
    func createFacts() {
        factsAboutSteveAndBill["Steve Jobs"]=["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                                              "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                                              "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                                              "He was a pescetarian, meaning he ate no meat except for fish."]
        factsAboutSteveAndBill["Bill Gates"]=["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                                              "He scored 1590 (out of 1600) on his SATs.",
                                              "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                                              "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.",
                                              "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game."]
    }
    func getRandomFact() -> (name: String, factToDisplay: String) {
        var name = randomPerson()
        print("Name of random person picked: \(name)")
        var factToDisplay = ""
        var indexOfFact: Int
        
        if(name == "Steve Jobs") {
            if let arrayOfFacts=factsAboutSteveAndBill[name]{
                if(arrayOfFacts.count>0){
                    indexOfFact=randomNumberFromZeroTo(arrayOfFacts.count)
                    print("Index of fact is \(indexOfFact)")
                    factToDisplay=arrayOfFacts[indexOfFact]
                    print("The fact to dislay is this jIM!: \(factToDisplay)")
                    factsAboutSteveAndBill[name]?.removeAtIndex(indexOfFact)
                }else{
                    name="Bill Gates"
                    if let arrayOfFacts=factsAboutSteveAndBill[name]{
                        if(arrayOfFacts.count>0){
                            indexOfFact=randomNumberFromZeroTo(arrayOfFacts.count)
                            factToDisplay=arrayOfFacts[indexOfFact]
                            factsAboutSteveAndBill[name]?.removeAtIndex(indexOfFact)
                        }else{
                            factToDisplay = "Game Over"
                            count=0
                        }
                        
                    }
                }
                
            }
        }
        if(name=="Bill Gates"){
            if let arrayOfFacts=factsAboutSteveAndBill[name]{
                if(arrayOfFacts.count>0){
                    indexOfFact=randomNumberFromZeroTo(arrayOfFacts.count)
                    factToDisplay=arrayOfFacts[indexOfFact]
                    factsAboutSteveAndBill[name]?.removeAtIndex(indexOfFact)
                }else{
                    name="Steve Jobs"
                    if let arrayOfFacts=factsAboutSteveAndBill[name]{
                        if(arrayOfFacts.count>0){
                            indexOfFact=randomNumberFromZeroTo(arrayOfFacts.count)
                            factToDisplay=arrayOfFacts[indexOfFact]
                            factsAboutSteveAndBill[name]?.removeAtIndex(indexOfFact)
                        }else{
                            factToDisplay = "Game Over"
                            count=0
                        }
                        
                    }
                }
                
            }
        }

        print("About to return from the function the tuple, name is \(name) and the factToDisplay is \(factToDisplay)")
       return(name,factToDisplay)
    }

    
    func showFact(){
        print("BEGINNNING OF SHOW FACT FUNCTION!!!!")
        
        let personAndFact = getRandomFact()
        nameOfThePerson = personAndFact.name
        fact.text = personAndFact.factToDisplay
        
//         nameOfThePerson=getRandomFact().name
//        fact.text=getRandomFact().factToDisplay
        
        print("THe name of the person is \(nameOfThePerson)")
        print("The fact is \(fact.text)")
        print("END OF THE SHOWFACT FUNCTION CALL!!!!!")
        
            }
}

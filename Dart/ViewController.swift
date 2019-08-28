//
//  ViewController.swift
//  Dart
//
//  Created by Tejay Beckedorf on 16.06.19.
//  Copyright © 2019 Tejay Beckedorf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentPoints1: UILabel!
    @IBOutlet weak var currentPoints2: UILabel!
    @IBOutlet weak var LabelPlayerOne: UILabel!
    @IBOutlet weak var LabelPlayerTwo: UILabel!
    @IBOutlet weak var throwIndicator1: UILabel!
    @IBOutlet weak var throwIndicator2: UILabel!
    @IBOutlet weak var throwIndicator3: UILabel!
    
    @IBOutlet weak var currentMultiplierSegment: UISegmentedControl!
   
    var startingPoints: Int = 12;
    var currentGame:Game = Game(11)
    var currentMultiplier:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentGame = Game(startingPoints)
        initScreen()
    }
    
    func initScreen(){
        LabelPlayerOne.text = currentGame.getPlayer(0).getName()
        LabelPlayerTwo.text = currentGame.getPlayer(1).getName()
        currentMultiplierSegment.backgroundColor = .white
        currentMultiplierSegment.tintColor = .black
        refreshUI()
    }
    
    func refreshUI(){
        currentPoints1.text = String(currentGame.getPlayer(0).getRemainingPoints())
        currentPoints2.text = String(currentGame.getPlayer(1).getRemainingPoints())
        resetMulitiplier()
        changeColorPoints()
        toogleThrowIndicators()
    }
    
    func changeColorPoints(){
        if (currentGame.getCurrentPlayerIndex() == 0){
            currentPoints1.textColor = .green
            currentPoints2.textColor = .red
        } else {
            currentPoints1.textColor = .red
            currentPoints2.textColor = .green
        }
    }
    
    func toogleThrowIndicators(){
        switch currentGame.getCurrentNumberOfThrows()+1 {
        case 1:
            throwIndicator1.alpha = 1
            throwIndicator2.alpha = 0.25
            throwIndicator3.alpha = 0.25
            
        case 2:
            throwIndicator1.alpha = 1
            throwIndicator2.alpha = 1
            throwIndicator3.alpha = 0.25
            
        case 3:
            throwIndicator1.alpha = 1
            throwIndicator2.alpha = 1
            throwIndicator3.alpha = 1
        default:
            throwIndicator1.alpha = 1
            throwIndicator2.alpha = 0.25
            throwIndicator3.alpha = 0.25
        }
    }
    
    func resetMulitiplier(){
        currentMultiplierSegment.selectedSegmentIndex = 0
        currentMultiplier = 1
    }
    
    @IBAction func updateMultiplier(_ sender: Any) {
        currentMultiplier = currentMultiplierSegment.selectedSegmentIndex + 1
    }
    
    @IBAction func onButtonPress(_ sender: UIButton) {
        let points: Int = Int(sender.currentTitle!)!
        currentGame.tryThrow(points * currentMultiplier)
        
        if ((points * currentMultiplier) == 75){
            currentMultiplier = 3
            currentMultiplierSegment.selectedSegmentIndex = 2
        }else{
            refreshUI();
        }
        if (currentGame.getCurrentPlayer().getRemainingPoints() == 0){
            showWinAlert()
        }
    }
    
    @IBAction func missButton(_ sender: Any) {
        currentGame.tryThrow(0)
        refreshUI()
    }
    
    @IBAction func newGame(_ sender: Any) {
        let alert = UIAlertController(title: "Welche Variante soll gespielt werden?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Neues 301er Spiel", style: .default, handler: {action in
            self.startingPoints = 301
            self.currentGame = Game(self.startingPoints)
            self.refreshUI()
        }))
        alert.addAction(UIAlertAction(title: "Neues 501er Spiel", style: .default, handler: {action in
            self.startingPoints = 501
            self.currentGame = Game(self.startingPoints)
            self.refreshUI()
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func undoThrow(_ sender: Any) {
        currentGame.undoThrow()
        refreshUI()
    }
    
    
    func showWinAlert() {
            let alert = UIAlertController(title: "🏆 Glückwunsch! 🏆", message: currentGame.getCurrentPlayer().getName() + " hat gewonnen!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Neues 301er Spiel", style: .default, handler: {action in
                self.startingPoints = 301
                self.currentGame = Game(self.startingPoints)
                self.refreshUI()
            }))
            alert.addAction(UIAlertAction(title: "Neues 501er Spiel", style: .default, handler: {action in
                self.startingPoints = 501
                self.currentGame = Game(self.startingPoints)
                self.refreshUI()
            }))
            
            self.present(alert, animated: true)
    }
    
    func showNewGameAlert2(){
        let alert = UIAlertController(title: "🎯 Willkommen! 🎯", message: "Welche Variante soll gespielt werden?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "301er Spiel", style: .default, handler: {action in
            self.startingPoints = 301
            self.currentGame = Game(self.startingPoints)
            self.refreshUI()
        }))
        alert.addAction(UIAlertAction(title: "501er Spiel", style: .default, handler: {action in
            self.startingPoints = 501
            self.currentGame = Game(self.startingPoints)
            self.refreshUI()
        }))
        
        self.present(alert, animated: true)
    }
    
    
}


//
//  ViewController.swift
//  calculator
//
//  Created by Евангелина Клюкай on 30/07/2019.
//  Copyright © 2019 Евангелина Клюкай. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var displayResaltLabel: UILabel!
    var stillTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSing: String = ""
    
    var currentImput: Double {
        get{
            return Double(displayResaltLabel.text!)!
        }
        set{
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResaltLabel.text = "\(valueArray[0])"
            }else{
                displayResaltLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if (displayResaltLabel.text?.count)! < 20 {
                displayResaltLabel.text = displayResaltLabel.text! + number
            }
        } else {
            displayResaltLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandsSingPressed(_ sender: UIButton) {
        operationSing = sender.currentTitle!
       firstOperand = currentImput
        stillTyping = false
        dotIsPlaced =  false
        
    }
    func operateWitchTwoOperand(operation: (Double, Double) -> Double) {
        currentImput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equaletySingPressed(_ sender: UIButton) {
        if stillTyping{
            secondOperand = currentImput
    }
        dotIsPlaced = false
        
        switch operationSing {
             case "+":
                operateWitchTwoOperand{$0 + $1}
             case "-":
                operateWitchTwoOperand{$0 - $1}
             case "×":
                operateWitchTwoOperand{$0 * $1}
             case "÷":
                operateWitchTwoOperand{$0 / $1}
        default:break
           
        }        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentImput = 0
        displayResaltLabel.text = "0"
        stillTyping = false
        operationSing = ""
        dotIsPlaced = false
    }
    
    @IBAction func plusMinusButtoPressed(_ sender: UIButton) {
        currentImput = -currentImput
    }
    
    @IBAction func persentegeButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentImput = currentImput/100
        }else{
            secondOperand = firstOperand * currentImput/100
        }
        stillTyping = false
    }
    
    @IBAction func squwereRootButtonPressed(_ sender: UIButton) {
        currentImput = sqrt(currentImput)
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced{
            displayResaltLabel.text = displayResaltLabel.text! + "."
            dotIsPlaced = true
        }else if !stillTyping && !dotIsPlaced {
            displayResaltLabel.text = "0."
        }
    }
}


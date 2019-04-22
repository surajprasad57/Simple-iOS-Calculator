//
//  ViewController.swift
//  SurajCalculator
//
//  Created by Suraj Prasad on 13/02/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    
    var num1:Int = 0
    var num2:Int = 0
    var operand:String = "+"
    var result : Double = 0.0
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    var defaultNum:String = "0"
    
    func printNumber() {
        lblText.text = defaultNum
    }
    func saveNum1() {
        num1 = Int(defaultNum)!
        defaultNum = "0"
        printNumber()
    }
    func saveOperand() {
        num1 = Int(defaultNum)!
        defaultNum = operand
        printNumber()
    }
    @IBAction func pressNum(_ sender: UIButton) {
        errorLabel.text = " "
        if sender.tag>=0 && sender.tag<10 {
            defaultNum.append(String(sender.tag))
            printNumber()
        }
        else {
            errorLabel.text = "Maths Error."
        }
    }
    @IBAction func setOperands(_ sender: UIButton) {
        errorLabel.text = " "
        if sender.tag==10 {
            operand = "+"
            saveOperand()
            defaultNum = "0"
        }
        if sender.tag==11 {
            operand = "-"
            saveOperand()
            defaultNum = "0"
        }
        if sender.tag==12 {
            operand = "*"
            saveOperand()
            defaultNum = "0"
        }
        if sender.tag==13 {
            operand = "/"
            saveOperand()
            defaultNum = "0"
        }
        if sender.tag == -2 {
            defaultNum = "0"
            printNumber()
            errorLabel.text = " "
        }
    }
    @IBAction func calculateResult(_ sender: UIButton) {
        errorLabel.text = " "
        num2 = Int(defaultNum)!
        if operand == "+" {
            result = Double(num1 + num2)
        }
        if operand == "-" {
            result = Double(num1 - num2)
        }
        if operand == "*" {
            result = Double(num1 * num2)
        }
        if operand == "/" {
            if num2 == 0 {
                errorLabel.text = "Divide by 0 not allowed. Try Again"
            }
            else
            {
                result = Double(num1) / Double(num2)
            }
        }
        num1 = 0
        num2 = 0
        operand = "+"
        defaultNum = String(result)
        printNumber()
        result = 0.0
        defaultNum = "0"
    }
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printNumber()
    }
}

//
//  ViewController.swift
//  Calculator
//
//  Created by Kaveen Abeywansa on 8/14/19.
//  Copyright © 2019 Kaveen Abeywansa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // init variables
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    // func when number keys are pressed
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
            // started entering 2nd number
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false;
        }
        else
        {
            // append digit to label
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    // operational button pressed
    @IBAction func btn_cmds(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            // dot
            if sender.tag == 19
            {
                label.text = label.text! + "."
                numberOnScreen = Double(label.text!)!
                return
            }
            // mathematical operation command
            previousNumber = Double(label.text!)!
            
            // divide
            if sender.tag == 12
            {
                label.text = "/"
            }
            // multiply
            if sender.tag == 13
            {
                label.text = "x"
            }
            // subtract
            if sender.tag == 14
            {
                label.text = "-"
            }
            // add
            if sender.tag == 15
            {
                label.text = "+"
            }
            // percentage
            if sender.tag == 18
            {
                label.text = String(Double(label.text!)! / 100)
                numberOnScreen = Double(label.text!)!
            }
            // plus or minus
            if sender.tag == 17
            {
                var dspVal:Double = Double(label.text!)!
                dspVal.negate()
                
                label.text = String(dspVal)
                numberOnScreen = Double(label.text!)!
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16
        {
            // equal btn pressed
            
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            // clear btn pressed
            
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        else if sender.tag == 19
        {
            label.text = "Fuck ne"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}


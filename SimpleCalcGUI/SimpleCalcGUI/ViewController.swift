//
//  ViewController.swift
//  SimpleCalcGUI
//
//  Created by iGuest on 10/21/15.
//  Copyright (c) 2015 Alex Schenck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var TxtFieldResult: UITextField!
    var running : Double = -1
    var op : String = ""
    var operand : Double = -1
    var count : Double = 1
    
    @IBAction func AppendNumberToField(sender: UIButton) {
        if let text = sender.titleLabel?.text
        {
            TxtFieldResult.text! += text
            
            if (op == "") {
                running = (TxtFieldResult.text! as NSString).doubleValue
            }
            else {
                operand = (TxtFieldResult.text! as NSString).doubleValue
            }
        }
    }
    
    @IBAction func AddOperation(sender: UIButton) {
        if (op != "")
        {
            RunEquals(sender);
        }

        TxtFieldResult.text! = ""
        
        if let text = sender.titleLabel?.text
        {
            op = text
            
            if (op == "fact") {
                RunEquals(sender)
            }
        }
    }
    
    @IBAction func RunEquals(sender: UIButton) {
        count++
        
        switch op {
            case "+":
                running += operand
            case "-":
                running -= operand
            case "x":
                running *= operand
            case "/":
                running /= operand
            case "%":
                running %= operand
            case "avg":
                running = (running + operand) / count
            case "count":
                running = Double(count)
            case "fact":
                running = factorial(running)
            default:
                running = 1 * running
        }
        
        TxtFieldResult.text! = String(format:"%.1f", running)
        op = ""
        operand = -1
        
        if let text = sender.titleLabel?.text
        {
            if text == "=" {
                count = 1
            }
        }
    }
    
    @IBAction func ClearField(sender: UIButton) {
        TxtFieldResult.text! = ""
        running = -1
        op = ""
        operand = -1
        count = 1
    }
    
    func factorial(incoming: Double) -> Double {
        if incoming < 2 {
            return 1
        }
        else {
            return incoming * factorial(incoming - 1)
        }
    }
}


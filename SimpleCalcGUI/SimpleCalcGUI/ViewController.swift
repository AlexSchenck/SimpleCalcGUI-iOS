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
    var count : Int = 0
    
    @IBAction func AppendNumberToField(sender: UIButton) {
        if let text = sender.titleLabel?.text
        {
            TxtFieldResult.text! += text
            
            if (op == "") {
                running = (text as NSString).doubleValue
            }
            else {
                operand = (text as NSString).doubleValue
            }
        }
    }
    
    @IBAction func AddOperation(sender: UIButton) {
        if (op != "")
        {
            RunEquals(sender);
        }
        else
        {
            TxtFieldResult.text! = ""
        }
        
        if let text = sender.titleLabel?.text
        {
            op = text
        }
    }
    
    @IBAction func RunEquals(sender: UIButton) {
        switch op {
            case "+":
                running += operand
            case "-":
                running -= operand
            case "x":
                running *= operand
            case "/":
                running /= operand
            case "avg":
                running += operand
                running /= Double(count)
            case "count":
                running = Double(count)
            case "fact":
                running = factorial(running)
            default:
                running = 0
        }
        
        TxtFieldResult.text! = String(format:"%.1f", running)
        operand = -1
    }
    
    @IBAction func ClearField(sender: UIButton) {
        TxtFieldResult.text! = ""
        running = -1
        op = ""
        operand = -1
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


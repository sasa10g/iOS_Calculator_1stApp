//
//  ViewController.swift
//  Calculator
//
//  Created by Sasa Gvozdenovic on 05/02/2018.
//  Copyright © 2018 Sasa Gvozdenovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var preformingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if preformingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            preformingMath = false;
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }

    
    @IBAction func buttons(_ sender: Any)
    {
        if label.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if (sender as AnyObject).tag == 12 // /
            {
                label.text = "/";
            }
            else if (sender as AnyObject).tag == 13 // X
            {
                label.text = "x";
            }
            else if (sender as AnyObject).tag == 14 // -
            {
                label.text = "-";
            }
            else if (sender as AnyObject).tag == 15 // +
            {
                label.text = "+";
            }
            
            operation = (sender as AnyObject).tag
            preformingMath = true
        }
        else if (sender as AnyObject).tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if (sender as AnyObject).tag == 11
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Mac on 1/12/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var billamountText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$ 0.00"
        totalLabel.text="$ 0.00"
        billamountText.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = (tipPercentages[tipControl.selectedSegmentIndex] as NSNumber).floatValue
        
        var billamount = (billamountText.text as NSString).floatValue
        var tip = billamount * tipPercentage
        var total = billamount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {view.endEditing(true) }
        
    func textFieldDidBeginEditing(textField: UITextField) {
        animateKeyBoard(true, moveValue: 100)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        animateKeyBoard(false, moveValue: 100)
    }
    
    func animateKeyBoard (up:Bool, moveValue :CGFloat) {
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
}


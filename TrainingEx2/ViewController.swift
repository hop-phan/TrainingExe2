//
//  ViewController.swift
//  TrainingEx2
//
//  Created by HopPD on 8/25/16.
//  Copyright © 2016 HopPD. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SSRadioButtonControllerDelegate{
    
    //MARK:Properties
    
    @IBOutlet weak var bt1: SSRadioButton!
    
    @IBOutlet weak var bt2: SSRadioButton!
    
    @IBOutlet weak var Ho: UITextField!
    
    @IBOutlet weak var Ten: UITextField!
    
    @IBOutlet weak var KanaHo: UITextField!
    
    @IBOutlet weak var KanaTeb: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var NgaySinh: UITextField!
    
    @IBOutlet weak var tel1: UITextField!
    
    @IBOutlet weak var tel2: UITextField!
    
    @IBOutlet weak var tel3: UITextField!
    
    var EmailValid :Bool = false
    var InputAll :Bool = false
    
    var radioButtonController: SSRadioButtonsController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        radioButtonController = SSRadioButtonsController(buttons: bt1, bt2)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = false
    }
    
    @IBAction func dangky(sender: AnyObject) {
        
        InputAll = isInputAll()
        EmailValid = isValidEmail(Email.text!)
        isInputAll()
        isValidEmail(Email.text!)
        
        if InputAll == true && EmailValid == true {
            PrintResult()
            let alert = UIAlertController(title: "Success", message: "Đăng ký thành công", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func PrintResult(){
        print("Họ: " + Ho.text!)
        print("Tên: " + Ten.text!)
        print("Họ Kana: " + KanaHo.text!)
        print("Tên Kana: " + KanaTeb.text!)
        print("Email: " + Email.text!)
        print("Ngày sinh: " + NgaySinh.text!)
        print("Phone Number: " + tel1.text! + tel2.text! + tel3.text!)}
    
    func isValidEmail(testStr:String) -> Bool {
        
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailTest.evaluateWithObject(testStr) == false
        {
            
            
            let alert = UIAlertController(title: "Error", message: "Email sai định dạng", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return false
        }
            
        else {
            return true
        }
    }
    
    func  isInputAll() -> Bool  {
        if (Ho.text == "" || Ten.text == "" || KanaHo.text == "" || KanaTeb.text == "" || NgaySinh.text == "" || tel1.text == "" || tel2.text == "" || tel3.text == "") {
            
            let alert = UIAlertController(title: "Error", message: "Chưa nhập đủ đầu vào", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        else {
            return true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


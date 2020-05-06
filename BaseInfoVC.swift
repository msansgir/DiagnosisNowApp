//
//  BaseInfoVC.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/6/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

let screenR : CGRect = UIScreen.main.bounds
let w = screenR.width
let h = screenR.height


class BaseInfoVC: UIViewController,  UITextFieldDelegate{

    
 
    
    
    
    var gender1 : String = ""
    var weight1 : Double = 0.0
    var height1 : Double = 0.0
    
    @IBOutlet weak var bmi: UITextView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(String(Int(w)) + " " + String(Int(h)))
       // self.age.position(within: <#T##UITextRange#>, atCharacterOffset: <#T##Int#>)
        self.age.delegate = self
        self.height.delegate = self
        self.weight.delegate = self
        bmi.layer.cornerRadius = 0.5
        
       //calc()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func fix(_ sender: Any) {
        calc()
    }
    func calc() {
        var x : Double? = 0.0
        if weight.text! != nil && height.text! != nil {
        weight1 = Double(weight.text!)!
        height1 = Double(height.text!)!

        if weight1 != 0.0 && height1 != 0.0 {
           x = (weight1 * 0.4535) / ((height1 * 0.0254) * (height1 * 0.0254) )
        x =     x?.rounded()
        bmi.text = String(x!)
            
            
            
            
            
            
        }
        }
        
        switch x! {
            
        case 0.0...15.5 :
            bmi.textColor = UIColor.red
           bmi.text += "\n You are severely underweight"
        case 15.5...18.5 :
            bmi.textColor = UIColor.red
            bmi.text += "\n You are underweight"
        case 25.0...26.9 :
            bmi.textColor = UIColor.yellow
             bmi.text += "\n You are slightly overweight"
            
        case 26.9...29.9 :
            bmi.textColor = UIColor.yellow
            bmi.text += "\n You are overweight"
        case 30.0...10000 :
            bmi.textColor = UIColor.red
            bmi.text += "\n You are severely overweight"
        default :
           // bmi.textColor = UIColor.init(red: 55/225, green: 102/255, blue: 58/255, alpha: 1)
            bmi.textColor = UIColor.green
             bmi.text += "\n You're BMI is good"
        }
        
       
        
        
    }
    
    
   
    @IBAction func gender(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0 : gender1 = "Male"
        case 1 :
            gender1 = "Female"
            
        default :
            gender1 = ""
        }
        
        let fileName = "An"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            do {
                try gender1.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            
            //Send help
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
        /**/
        // Emerald Green and navy blue with light blue undertones and white 

}
}

//
//  Eval.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/24/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class Eval: UIViewController {

    @IBOutlet weak var concLabel: UILabel!
    @IBOutlet weak var box: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//readingThisBitch()
        readHer()
        // Do any additional setup after loading the view.
    }
    
  
    func readHer () {
        
        let fileName1 = "user"
        let dir1 = try? FileManager.default.url(for: .documentDirectory,
                                                in: .userDomainMask, appropriateFor: nil, create: true)
         var inString = ""
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir1?.appendingPathComponent(fileName1).appendingPathExtension("txt") {
            
            
            // Then reading it back from the file
           
            do {
                inString = try String(contentsOf: fileURL)
               
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
        }
       
        var baz : [String]  = [String]()
        
        baz = inString.components(separatedBy: " ")
        
        print(baz)
        
        //
        
        if baz.count == 1 {
              box.text = baz[0].replacingOccurrences(of: "_", with: " ")
            
            
        }else {
        
        if baz.count >= 3 {
            
            
        
            
        var ans = baz[0]
        
        if ans == baz[1] || ( ans == baz[1] && ans == baz[2] ) {
            box.text = ans.replacingOccurrences(of: "_", with: " ")
        
        
            
            
            
        }else
            if ans == baz[2] || ( baz[1] == baz[2]) {
                ans = baz[2]
                box.text = ans.replacingOccurrences(of: "_", with: " ")
            }else {
                  box.text = ans.replacingOccurrences(of: "_", with: " ")
        }
        
         let B = BloodTest()
        
        
        var check = 0
        
        var i = 0
        
        while check == 0 {
            
          
            if B.read()[i].contains(ans) {
                
                box.text += "\n\n" + B.read()[i+4]
                check += 1
            }else {
            i += 1
            }
        }
            
        }else {
            
            if baz.count == 2 && (baz[0] == baz[1] ){
                 let B = BloodTest()
                 box.text = baz[0].replacingOccurrences(of: "_", with: " ")
                var check = 0
                
                var i = 0
                
                while check == 0 {
                    
                    
                    if B.read()[i].contains(baz[0]) {
                        
                        box.text += "\n\n" + B.read()[i+4]
                        check += 1
                    }else {
                        i += 1
                    }
                }
                
            }else {
            concLabel.text = "Inconclusive Evaluation"
            let B = BloodTest()
            for j in baz {
                
                box.text +=  j.replacingOccurrences(of: "_", with: " ")
            var check = 0
            
            var i = 0
            
            while check == 0 {
                
                
                if B.read()[i].contains(j) {
                    box.text += "\n" + B.read()[i+4]
                    check += 1
                }else {
                    i += 1
                }
            }
            
                box.text += "\n"
        
            }
        }
        }
        }
        
    }
    
  /*  func readingThisBitch() {
         var inString = ""
        var total : [String] = [String]()
        var val : [Double] = [Double]()
        let fileName1 = "AnemiaSymp"
        let dir1 = try? FileManager.default.url(for: .documentDirectory,
                                                in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir1?.appendingPathComponent(fileName1).appendingPathExtension("txt") {
            
            
            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
                total = inString.components(separatedBy: " ")
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
        }
        total.remove(at: (total.count - 1))
        
        for i in total {
            val.append(Double(i)!)
        }
        
        ///We'll get the bread tomorrow
        let hm = Math()
        let B = BloodTest()
       let g = B.read()[hm.largest(set: val) * 5].components(separatedBy: " ")[0].replacingOccurrences(of: "_", with: " ")
        
        let f = B.read()[(hm.largest(set: val) * 5 ) + 4]
        box.text = g + "\n\n" + f
        
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  DiseaseViewController.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 6/17/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class DiseaseViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UITextView!
    @IBOutlet weak var symptomsLabel: UITextView!
    @IBOutlet weak var testLabel: UITextView!
    var diseaseName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let d = UserDefaults.standard
        diseaseName = d.string(forKey: "name")!
        nameLabel.text = diseaseName
        search()
        // Do any additional setup after loading the view.
    }
    

    func search() {
        var x = 0
        var elian : [String] = [String]()
        var b =  reader(folder: "InfectionSymp")
        for i in 0...b.count/5 {
            print(b[i*5].components(separatedBy: " ")[0].replacingOccurrences(of: "_", with: " "))
           //print(b[i*5].components(separatedBy: " "))
            elian.append(b[i*5].components(separatedBy: " ")[0].replacingOccurrences(of: "_", with: " "))
        }
       
        print(diseaseName)
    print(elian.index(of: diseaseName))
        
        
        
    }
    
    func reader(folder : String) -> [String]
    {
        var contents = ""
        var disease : [String] = [String]()
        if folder != "AnemiaSymp" {
            if let filepath = Bundle.main.path(forResource: folder, ofType: "txt") {
                do {
                    
                    contents = try String(contentsOfFile: filepath)
                    disease  = contents.components(separatedBy: "\n")
                    
                } catch {
                    // contents could not be loaded
                }
            } else {
                // example.txt not found!
            }
        }else {
            let s = Symptom()
            contents = s.anemiaSymp()
            disease = contents.components(separatedBy: "=")
        }
        return disease
        
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

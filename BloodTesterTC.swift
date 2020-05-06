//
//  BloodTesterTC.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/21/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class BloodTesterTC:  UIViewController,UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate {
    
    var mathS = Math()
    var animals: [String] = [String]()
    var name : [String] = [String]()
    var head : [String] = [String] ()
    var ranges : [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        read()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    var allCellsText = [String](repeating: "noData", count: 115)
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
        cell.textLab?.delegate = self
        cell.textLab?.text = ""
        cell.textLab?.placeholder = animals[indexPath.row]
        cell.textLab?.autocorrectionType = UITextAutocorrectionType.no
        cell.textLab?.autocapitalizationType = UITextAutocapitalizationType.none
        cell.textLab?.adjustsFontSizeToFitWidth = true
        let team = name[indexPath.row]
        cell.textLabel!.text = team
          cell.textLabel!.textColor  = UIColor.init(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        return cell
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = head.index(of:textField.placeholder!)
        //print(indexOf)
       // if(textField.placeholder! == animals[indexOf!]){
           // if( indexOf! <= (allCellsText.count - 1)){
           //     allCellsText.remove(at: indexOf!)
        //    }
            if textField.text != nil {
                print(String(indexOf!))
            allCellsText[indexOf!] = textField.text! //text(textField.text!, at: indexOf!)
            }
            print(allCellsText)
            var s = BloodTest()
           
            s.tester(list: s.rangeDefiner(ran: ranges, list: allCellsText ))
        s.need()
      //  }
    }
    //delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func read(){
        
        var apna : [String] = [String]()
        
        let fileName = "this"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
                apna = inString.components(separatedBy: " ")
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
        }
        
     /*   var x  : String = ""
        switch(apna.count - 1) {
            
        case 34 :
            x = "AnemiaSymp"
        case 18:
            x = "InfectionSymp"
        case 3:
            x = "CardioSymp"
            
        case 4:
            x = "TraumaSymp"
            
        case 38 :
            
            x = "CancerSymp"
            
        case 31:
            
            x = "STDSymp"
            
        default :
            x = "AnemiaSymp"
            
        }
        var con : [String] = [String]()
        if let filepath = Bundle.main.path(forResource: x, ofType: "txt") {
            do {
                var contents = ""
                
                if x == "AnemiaSymp" {
                    
                    contents = "Iron_Deficiency_Anemia 10 32 0 2 5 1 25 29 148 8 46 28 30=8 3 15=CBC VFF=Iron_Deficiency_Anemia 1 LOW 2 LOW 3 LOW 30 LOW=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 21 38 48 50 36 150 0 25 49 47 134 40 118 46 149 41 151 152 6 10 5 14 22 =4 3 1 10=CBC VFF=Vitamin_B12_Deficiency 1 LOW 31 LOW 33 LOW=Take Vitamin B12 supplements =Thalessemia 7 3 0 2 148 1 10 =7=CBC=Thalessemia 1 LOW 15 HIGH 2 LOW 3 LOW 4 LOW 5 low 7 HIGH=You have a hereditary condition, see doctor for medication options=Aplastic_Anemia 31 6 8 10 118 53 30 2 5 29 0 25 10 =-1=CBC=Aplastic_Anemia 0 LOW 1 LOW 8 LOW 9 low =You may need a bone transplant based on the diagnosis=Sickle_Cell_Anemia 25 0 116 114 3 111 4 8 =6=CBC LDH=Sickle_Cell_Anemia 1 LOW 2 LOW 8 high 15 HIGH 59 high=You have a hereditary condition involving round hollow blood cells which are causing your symptoms=Jaundice_Hepatitis 3 0 1 17 110 6 =5 10 =CBC LIVERP HEP=Jaundice_Hepatitis 1 LOW 2 low 3 low 24 HIGH 25 HIGH 26 HIGH 27 HIGH 28 HIGH 109 neg 110 neg=Stay home take rest and avoid eating anything with fat  =Jaundice 3 0 1 5 110 6 =5 10 =CBC LIVERP=Jaundice 1 LOW 2 low 3 low 24 HIGH 25 HIGH 26 HIGH 27 HIGH 28 HIGH=Stay home take rest and avoid eating anything with fat =Jaundice_Cirrhosis 3 0 1 5 75 128 17 110 6 =9 10=CBC LIVERP HEP=Jaundice_Cirrhosis 1 LOW 2 low 3 low 28 HIGH 109 NEG 110 NEG 24 HIGH 25 HIGH 26 HIGH 27 HIGH=Stay home take rest and avoid eating anything with fat  =G6PD_Deficiency 0 2 6 51 15 3 75 10 6=0 2 6 7=CBC LIVERP LDH=G6PD_Deficiency 0 high 1 LOW 8 LOW 59 high=Stop whatever your trigger was (legumes, drugs etc) =G6PD_Deficiency 51 3 15=0 =CBC CMP =G6PD_Deficiency =Eat Iron rich foods (Spinach, Red meat) or take supplements=Chrohnís_disease 17 16 99 6 54 0 75 14 15 43=10 14=CBC VFF EP=Chrohnís_disease 0 high 1 low 22 low 31 low 41 low 52 low =Talk to a doctor about surgery of anti-inflammatories =Paroxysmal_Nocturnal_Hemoglobinuria 76 5 65 77 10 =-1=CBC=Paroxysmal_Nocturnal_Hemoglobinuria 0 low 1 low 2 low 3 low 4 low=Consult with your doctor. A Ham's test is recommended=Hereditary_Spherocytosis 78 79 3=-1=CBC=Hereditary_Spherocytosis 1 LOW_WARNING=Check with your doctor about genetic testing=Glomerulonephritis 80 116 10 28 2 81 82 83 84 0=10=CBC BP GFR =Glomerulonephritis 1 LOW 68 HIGH 69 HIGH 70 LOW_WARNING=Bitch do what u want=Non-alcholic_Fatty_Liver_Disease 0 =4 16=CBC LIVERP BP=Non-alcholic_Fatty_Liver_Disease 26 high 27 high 68 high 69 high=Consult with doctor=Rheumatoid_Arthritis 73 43 87 88 145 57 62 89 21 90 =-1=CBC RAT=Rheumatoid_Arthritis 71 HIGH 72 HIGH=There is no treatment except for anti-inflammatories=Celiac's_disease 94 99 17 96 73 95 0 14 15=10 12 17=CBC ELISA TTG =Celiac's_disease 3 low 66 POS 73 POS=Stop eating gluten=Sjogren's_Disease 143 153 154 50 90 144 145 21 0=18=CBC ANTI=Sjogren's_Disease 3 low 111 POS 112 neg=Consult with doctor about an ANA test =Diverticulitis 17 95 54 146 12 =13=CBC LIVERP CRP=Diverticulitis 0 high 25 NORMAL 26 NORMAL 27 NORMAL 28 NORMAL 113 HIGH=Consult with your doctor about a stool test=Vitamin_B12_Deficiency 1 21=3=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Celiac's_disease 15 16 17 21=10 12=CBC ELISA TTG=Celiac's_disease 73 POS=Eat Iron rich foods (Spinach, Red meat) or take supplements=Iron_Deficiency_Anemia 0=0=CBC VFF=Iron_Deficiency_Anemia 0 low 3 low 8 low_warning=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 21 124=-1=CBC VFF=Vitamin_B12_Deficiency 31 low_warning=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 142 147=3=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Aplastic_Anemia 10 0=-1=CBC=Aplastic_Anemia 0 low 1 low 2 high 3 low=Look Towards getting a bone marrow biopsy=Aplastic_Anemia 6 1 53 10=-1=CBC=Aplastic_Anemia 0 low 1 low 2 low 3 low 8 low 11 high 12 high 15 high=Look Towards getting a bone marrow biopsy=Vitamin_B12_Deficiency 124=-1=CBC VFF=Vitamin_B12_Deficiency 31 normal=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 120=-1=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 46=-1=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 0 25 10=9=CBC VFF=Vitamin_B12_Deficiency 2 low 31 low 33 high=Eat Iron rich foods (Spinach, Red meat) or take supplements=Thalessemia 0 2=7=CBC=Thalessemia 1 LOW 15 HIGH 2 LOW 3 LOW=Consult with your doctor about your Hb-A levels=Thalessemia 2 4=7=CBC=Thalessemia 1 LOW 15 HIGH 2 LOW 3 LOW=Consult with your doctor about your Hb-A levels=Sickle_Cell_Anemia 116 111 149=6=CBC LDH=Sickle_Cell_Anemia 2 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Diverticulitis 17 146 54 16=-1=CBC LIVERP CRP=Diverticulitis 0 HIGH=Consult with your doctor about a stool test"
                    con = contents.components(separatedBy: "=")
                    
                }else {
                    contents = try String(contentsOfFile: filepath)
                    con = contents.components(separatedBy: "\n")
                }
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
 */
        apna.remove(at: (apna.count - 1))
        var fuckShitBitch : [Double] = [Double]()
        for x in apna {
            fuckShitBitch.append(Double(x)!)
        
        }
        let B = BloodTest()
       print(B.read()[ mathS.largest(set: fuckShitBitch)*5])
        death(bum: B.read()[2 + ( mathS.largest(set: fuckShitBitch)*5)].components(separatedBy: " "), nig: B.read())
        
    }
    
    func death(bum : [String], nig : [String]){
        var bum1 : [String] = [String]()
        bum1 = bum
        
        if let filepath = Bundle.main.path(forResource: "TestRanges", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                ranges = contents.components(separatedBy: "\n")
                
               
                
                //print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        var check = 0
        
        for i in 0...(bum1.count - 1 ) {
            var start = 0
            var number = 0
            bum1[i] = bum1[i].replacingOccurrences(of: "\r", with: "")
            print(bum1)
            switch bum1[i] {
            case "CBC":
                start = 0
                number = 16
                
            case "-":
                check += 1
                
            case "CMP":
                start = 16
                number = 14
                
            case "ANA" :
                start = 114
                number = 1
                
            case "VFF" :
                start = 30
                number = 4
                
            case "WASTE" :
                start = 34
                number = 2
                
            case "LPP" :
                start = 41
                number = 7
                
            case "EP":
                start = 38
                number = 4
                
            case "LDH":
                start = 59
                number = 1
                
            case "LP":
                start = 48
                number = 13
                
            case "LIVERP":
                start = 24
                number = 6
                
            case "ELISA":
                start = 66
                number = 1
                
            case "IFA" :
                start = 67
                number = 1
                
            case "IgA":
                start = 61
                number = 1
                
            case "IgG":
                start = 62
                number = 1
                
            case "IgM":
                start = 63
                number = 1
                
            case "IgE":
                start = 64
                number = 1
                
            case "IgD":
                start = 65
                number = 1
                
            case "BP":
                start = 68
                number = 2
                
            case "GFR" :
                start = 70
                number = 1
                
            case "RAT" :
                start = 71
                number = 2
                
            case "TTG" :
                start = 73
                number = 1
                
            case "CSF":
                start = 89
                number = 15
                
            case "C+ACTH":
                start = 104
                number = 2
                
            case "THY":
                start = 106
                number = 3
                
            case "HEP":
                start = 109
                number = 2
                
            case "ANTI" :
                start = 111
                number = 2
                
            case "CRP" :
                start = 113
                number = 1
                
                
            default:
                start = 0
                number = 16
            }
            if check == 0 {
            for h in start...(start + number - 1) {
                animals.append(ranges[h].components(separatedBy: " ")[0])
                name.append(ranges[h].components(separatedBy: " ")[0] + " " +  ranges[h].components(separatedBy: " ")[4])
            }
            for h in 0...115 {
                head.append(ranges[h].components(separatedBy: " ")[0])
            }
            }
            
        
    }
    
    
    
    
}
}

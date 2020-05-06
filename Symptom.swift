//
//  Symptom.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/6/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class Symptom {

    var symp : String = ""
    var mathStuff = Math()
    var total1 : [Double] = [Double]()
    
    func read1() {
        let fileName = "mathStuff"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
                symp = inString
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
        }
        
    }
    
    
    func symptomReader() {
        var contents : String = ""
        read1()
        if let filepath = Bundle.main.path(forResource: "DiseaseSymptoms", ofType: "txt") {
            do {
                contents = try String(contentsOfFile: filepath)
              
              //  print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        var inputSymp : [String] = symp.components(separatedBy: " ")
       inputSymp.remove(at: inputSymp.count - 1)
        var disease : [String] = contents.components(separatedBy: "\n")
        var total : [Double] = [Double]()
        print(inputSymp)
        for f in 0...4 {
            
            var totalVal : [Double] = [Double]()
            var xVal  : [Double] = [Double]()
            var diseaseSymp : [String] = disease[2*f].components(separatedBy: " ")
            let n = diseaseSymp.count - 1
            let x = inputSymp.count - 1
            print(inputSymp)
            for i in 1...n {
                totalVal.append((Double(i)/Double(n)))
            }
            if x != -1 {
            for g in 0...x {
                for t in 1...n {
                    if Int(inputSymp[g]) == Int(diseaseSymp[t]) {
                        
                        xVal.append(totalVal[t - 1])
                        
                    }
                }
            }
            }
            var equation : Double = 0.0
            if xVal.count != 0 {
            for j in 0...(xVal.count - 1 ) {
                equation += mathStuff.sigmoid(x: xVal[j])
            }
            }
            if xVal.count == n {
                equation += mathStuff.sigmoid(x: 0.4)
            }
            equation /= Double((xVal.count))
            total.append(equation)
            
            //print(diseaseSymp[0] + " " + String(equation))
 
        }
        
     print(String(mathStuff.largest(set: total)))
        reader(num : mathStuff.largest(set: total))
        print(total)
        
    }
    
    func reader2(folder : String, start : Int, end : Int, lines : Int){
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
            contents = anemiaSymp()
            disease = contents.components(separatedBy: "=")
        }
        var inputSymp : [String] = symp.components(separatedBy: " ")
        
       
       
       // print(inputSymp)
        for f in 0...(lines - 1 ) {
            
            var totalVal : [Double] = [Double]()
            var xVal  : [Double] = [Double]()
            var diseaseSymp : [String] = disease[5*f].components(separatedBy: " ")
            let n = diseaseSymp.count - 1
            let x = inputSymp.count - 1
            
            if n > 0 {
            for i in 1...n {
                totalVal.append((Double(i) / Double(n)))
                //print(totalVal)
            }
            
            for g in 0...x {
                for t in 1...n {
                    if Int(inputSymp[g]) == Int(diseaseSymp[t]) {
                        
                        xVal.append(totalVal[t - 1])
                        
                    }
                }
            }
            }
            var equation : Double = 0.0
            if xVal.count != 0 {
                for j in 0...(xVal.count - 1 ) {
                    equation += mathStuff.sigmoid(x: xVal[j])
                }
            }
            if xVal.count == n {
                equation += mathStuff.sigmoid(x: 0.4)
            }
            //equation /= Double((xVal.count))
            total1.append(equation)
            
           // print(diseaseSymp[0] + " " + String(equation))
            
        }
        
        //print( "UMM" + disease[mathStuff.largest(set: total1)].components(separatedBy: " ")[0])
        
        let fileName1 = "user"
        let dir1 = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir1?.appendingPathComponent(fileName1).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            do {
                try disease[mathStuff.largest(set: total1) * 5].components(separatedBy: " ")[0].write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            
            //Send help
            
        }
        //Wh da fuck knows
        
        
        var bazinga : String = folder + "=" + String(start) + "=" + String(end)
        let fileName = "mathStuff"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            do {
                try bazinga.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
          //  print("Read from the file: \(inString)")
        }
        
        
    }
    
    func reader(num : Int){
        switch num {
        case 0:
           
            reader2(folder : "AnemiaSymp", start: 0, end : 19, lines : 34 )
            
            break
        case 1:
             reader2(folder : "InfectionSymp", start: 19, end : 33, lines : 18 )
           
            break
        case 2:
            reader2(folder : "CardioSymp", start: 45, end : 49, lines : 3 )
            
            break
            
        case 3:
           
            reader2(folder : "TraumaSymp", start: 38, end : 45, lines : 4 )
            break;
        case 4:
            
            reader2(folder : "CancerSymp", start: 38, end : 41, lines : 34 )
            break;
        case 5:
             reader2(folder : "STDSymp", start: 31, end : 32, lines : 34 )
           
            break
        default:
             reader2(folder : "AnemiaSymp", start: 0, end : 19, lines : 34 )
        }
        
    }
    
    
    func needThis() {
        var hello = ""
        
        for x in total1 {
            hello += String(x) + " "
        }
        
        
        let fileName = "this"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            do {
                try hello.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
           // print("Read from the file: \(inString)")
        }
        
    }
    

    func anemiaSymp () -> String
    {
        
        return "Iron_Deficiency_Anemia 0 1=8 3 15=CBC VFF=Iron_Deficiency_Anemia 1 LOW 2 LOW 3 LOW 30 LOW=Eat Iron rich foods (Spinach, Red meat) or take supplements=Iron_Deficiency_Anemia 10 32 0 1 2 5 25 29 148 8 46 28 30=8 3 15=CBC VFF=Iron_Deficiency_Anemia 1 LOW 2 LOW 3 LOW 30 LOW=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 21 38 48 50 36 150 0 25 49 47 134 40 118 46 149 41 151 152 6 10 5 14 22 =4 3 1 10=CBC VFF=Vitamin_B12_Deficiency 1 LOW 31 LOW 33 LOW=Take Vitamin B12 supplements =Thalessemia 7 3 0 2 148 1 10 =7=CBC=Thalessemia 1 LOW 15 HIGH 2 LOW 3 LOW 4 LOW 5 low 7 HIGH=You have a hereditary condition, see doctor for medication options=Aplastic_Anemia 31 6 8 10 118 53 30 2 5 29 0 25 10 =-1=CBC=Aplastic_Anemia 0 LOW 1 LOW 8 LOW 9 low =You may need a bone transplant based on the diagnosis=Sickle_Cell_Anemia 25 0 116 114 3 111 4 8 =6=CBC LDH=Sickle_Cell_Anemia 1 LOW 2 LOW 8 high 15 HIGH 59 high=You have a hereditary condition involving round hollow blood cells which are causing your symptoms=Jaundice_Hepatitis 3 17 110 0 1 6 =5 10 =CBC LIVERP HEP=Jaundice_Hepatitis 1 LOW 2 low 3 low 24 HIGH 25 HIGH 26 HIGH 27 HIGH 28 HIGH 109 neg 110 neg=Stay home take rest and avoid eating anything with fat  =Jaundice 3 5 110 0 1 6 =5 10 =CBC LIVERP=Jaundice 1 LOW 2 low 3 low 24 HIGH 25 HIGH 26 HIGH 27 HIGH 28 HIGH=Stay home take rest and avoid eating anything with fat =Jaundice_Cirrhosis 3 5 75 128 17 0 1 110 6 =9 10=CBC LIVERP HEP=Jaundice_Cirrhosis 1 LOW 2 low 3 low 28 HIGH 109 NEG 110 NEG 24 HIGH 25 HIGH 26 HIGH 27 HIGH=Stay home take rest and avoid eating anything with fat  =G6PD_Deficiency 2 6 51 15 3 75 0 10 6=0 2 6 7=CBC LIVERP LDH=G6PD_Deficiency 0 high 1 LOW 8 LOW 59 high=Stop whatever your trigger was (legumes, drugs etc) =G6PD_Deficiency 51 3 15=0 =CBC CMP =G6PD_Deficiency =Eat Iron rich foods (Spinach, Red meat) or take supplements=Chrohnís_disease 17 16 99 6 54 0 75 14 15 43=10 14=CBC VFF EP=Chrohnís_disease 0 high 1 low 22 low 31 low 41 low 52 low =Talk to a doctor about surgery of anti-inflammatories =Paroxysmal_Nocturnal_Hemoglobinuria 76 5 65 77 10 =-1=CBC=Paroxysmal_Nocturnal_Hemoglobinuria 0 low 1 low 2 low 3 low 4 low=Consult with your doctor. A Ham's test is recommended=Hereditary_Spherocytosis 78 79 3=-1=CBC=Hereditary_Spherocytosis 1 LOW_WARNING=Check with your doctor about genetic testing=Glomerulonephritis 80 116 10 28 2 81 82 83 84 0=10=CBC BP GFR =Glomerulonephritis 1 LOW 68 HIGH 69 HIGH 70 LOW_WARNING=Bitch do what u want=Non-alcholic_Fatty_Liver_Disease 0 =4 16=CBC LIVERP BP=Non-alcholic_Fatty_Liver_Disease 26 high 27 high 68 high 69 high=Consult with doctor=Rheumatoid_Arthritis 73 43 87 88 145 57 62 89 21 90 =-1=CBC RAT=Rheumatoid_Arthritis 71 HIGH 72 HIGH=There is no treatment except for anti-inflammatories=Celiac's_disease 94 99 17 96 73 95 0 14 15=10 12 17=CBC ELISA TTG =Celiac's_disease 3 low 66 POS 73 POS=Stop eating gluten=Sjogren's_Disease 143 153 154 50 90 144 145 21 0=18=CBC ANTI=Sjogren's_Disease 3 low 111 POS 112 neg=Consult with doctor about an ANA test =Diverticulitis 17 95 54 146 12 =13=CBC LIVERP CRP=Diverticulitis 0 high 25 NORMAL 26 NORMAL 27 NORMAL 28 NORMAL 113 HIGH=Consult with your doctor about a stool test=Vitamin_B12_Deficiency 1 21=3=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Celiac's_disease 15 16 17 21=10 12=CBC ELISA TTG=Celiac's_disease 73 POS=Eat Iron rich foods (Spinach, Red meat) or take supplements=Iron_Deficiency_Anemia 0=0=CBC VFF=Iron_Deficiency_Anemia 0 low 3 low 8 low_warning=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 21 124=-1=CBC VFF=Vitamin_B12_Deficiency 31 low_warning=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 142 147=3=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Aplastic_Anemia 10 0=-1=CBC=Aplastic_Anemia 0 low 1 low 2 high 3 low=Look Towards getting a bone marrow biopsy=Aplastic_Anemia 6 1 53 10=-1=CBC=Aplastic_Anemia 0 low 1 low 2 low 3 low 8 low 11 high 12 high 15 high=Look Towards getting a bone marrow biopsy=Vitamin_B12_Deficiency 124=-1=CBC VFF=Vitamin_B12_Deficiency 31 normal=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 120=-1=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 46=-1=CBC VFF=Vitamin_B12_Deficiency 31 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Vitamin_B12_Deficiency 0 25 10=9=CBC VFF=Vitamin_B12_Deficiency 2 low 31 low 33 high=Eat Iron rich foods (Spinach, Red meat) or take supplements=Thalessemia 0 2=7=CBC=Thalessemia 1 LOW 15 HIGH 2 LOW 3 LOW=Consult with your doctor about your Hb-A levels=Thalessemia 2 4=7=CBC=Thalessemia 1 LOW 15 HIGH 2 LOW 3 LOW=Consult with your doctor about your Hb-A levels=Sickle_Cell_Anemia 116 111 149=6=CBC LDH=Sickle_Cell_Anemia 2 low=Eat Iron rich foods (Spinach, Red meat) or take supplements=Diverticulitis 17 146 54 16=-1=CBC LIVERP CRP=Diverticulitis 0 HIGH=Consult with your doctor about a stool test"
    }
}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



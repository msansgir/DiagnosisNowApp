//
//  Questioning.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/6/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class Questioning {

    var mathS = Math()
    var fucks : [Double] = [Double]()
    var pussy : [String] = [String]()
    
    func quest() {
         var inString = ""
        let fileName = "mathStuff"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
    
            
            // Then reading it back from the file
        
            do {
                inString = try String(contentsOf: fileURL)
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
        }
        
        
        var place : [String] = inString.components(separatedBy: "=")
        print(place)
        var yesAns : [String] = place[0].components(separatedBy: " ")
        var noAns : [String] = place[1].components(separatedBy: " ")
        let x : Int = Int(place[2].replacingOccurrences(of: " ", with: ""))!
        
        var fuckMe : [String] = reader(num1 : x)
       pussy = fuckMe
        //Work stuff??
        for i in 0...((fuckMe.count / 5 ) - 1 ) {
            var equation = 0.0
            var qL : [String] = fuckMe[(i*5) + 1].components(separatedBy: " ")
            for j in 0...(qL.count - 1) {
                if qL[j] != "-1" {
                    if  hell(that : qL[j], those : yesAns) != 0 {
                        equation += mathS.sigmoid(x: 0.5)
                    }else {
                          equation -= mathS.sigmoid(x: 10)
                    }
                }
            }
            //print(fuckMe[i*5].components(separatedBy: " ")[0] + " " + String(equation))
            fucks.append(equation)
            
        }
        
       print( "DIWD" + fuckMe[ mathS.largest(set: fucks) * 5])
        
        let fileName1 = "user"
        let dir1 = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir1?.appendingPathComponent(fileName1).appendingPathExtension("txt") {

            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
                inString = inString + " " + fuckMe[ mathS.largest(set: fucks) * 5].components(separatedBy: " ")[0]
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            do {
                try inString.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            
            //  print("Read from the file: \(inString)")
        }
        
    }
    
    func hell(that : String, those : [String]) -> Int  {
        var count = 0
       
            for j in 0...(those.count - 1) {
                if that == those[j] {
                    count += 1
                }
            
        }
        return count
    }
    
    func reader(num1 : Int) -> [String] {
        var x  : String = ""
        switch(num1) {
            
        case 0 :
            x = "AnemiaSymp"
        case 19:
            x = "InfectionSymp"
        case 45:
            x = "CardioSymp"
            
        case 38:
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
                    let s = Symptom()
                    contents = s.anemiaSymp()
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
        
        return con
        
    }

    func final() {
        var apna : [String] = [String]()
        var time : [Double] = [Double]()
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
        
        for i in 0...(fucks.count - 1) {
            time.append(Double(apna[i])! + fucks[i])
            
        }
        
        var hello = ""
        
        for g in time {
            hello += String(g) + " "
        }
        
        
        let fileName1 = "this"
        let dir1 = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir1?.appendingPathComponent(fileName1).appendingPathExtension("txt") {
            
            // Write to the file named Test
            
            do {
                try hello.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            
            // Then reading it back from the file
            
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}

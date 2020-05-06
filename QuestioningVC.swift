//
//  QuestioningVC.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/6/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class QuestioningVC: UITableViewController {
    
     var chosen : [String] = [String]()
    var cute : [String?] = [String?]()
var set : [String] = [String]()

  
   
    var ans : String = ""
    var yesAns : [String] = [String]()
     var noAns : [String] = [String]()
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chosen.count
    }
    
    @IBAction func hm(_ sender: Any) {
       
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "question", for: indexPath)
        
        
            let team = chosen[indexPath.row]
            cell.textLabel!.text = team
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        // cell.textLabel!.textColor  = UIColor.init(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Verdana", size: 20)
         cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
          
           
            
        }else  {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            yesAns.append(chosen[indexPath.row])
            
        }
        numQ()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
questioning()
       
    }
    
   
  
   
    func place(val : String, set : [String]) -> Int {
        var check = 0
        for i in 0...(set.count - 1) {
            if(set[i] == val) {
                check = 0
            }
        }
        return check
    }
    
    func questioning() {
      
        
        let fileName = "mathStuff"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            
            
            
            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
                cute = inString.components(separatedBy: "=")
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
        }
        
        if let filepath = Bundle.main.path(forResource: "DifferentialQuestion", ofType: "txt") {
            do {
                let cunts = try String(contentsOfFile: filepath)
                set = cunts.components(separatedBy: "\n")
                //print(cunts)
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
       
        let x : Int? = Int(cute[1]!)
        let y : Int? = Int(cute[2]!)
        
        if x != nil && y != nil {
        for i in x!...y!{
            chosen.append(set[i])
            
        }
        
        }
    }

    
    func numQ(){
        
       
            var hello : String = ""
        var hello1 : String = ""
            for s in 0...( yesAns.count - 1 ) {
                for g in 0...(set.count - 1 ) {
                    if(yesAns[s] == set[g]) {
                        hello += String(g) + " "
                    }
                }
            }
        
       
        
        /*var hello1 : String = ""
        for s in 0...( noAns.count - 1 ) {
            for g in 0...(set.count - 1 ) {
                if(noAns[s] == set[g]) {
                    hello1 += String(g) + " "
                }
            }
        }*/
        var s : String = hello + "= " + hello + "= " + cute[1]!
            let fileName = "mathStuff"
            let dir = try? FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask, appropriateFor: nil, create: true)
            
            // If the directory was found, we write a file to it and read it back
            if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
                
                // Write to the file named Test
                
                do {
                    try s.write(to: fileURL, atomically: true, encoding: .utf8)
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
                print("Read from the file: \(inString)")
            }
            
        let q = Questioning()
        q.quest()
        q.final() 
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

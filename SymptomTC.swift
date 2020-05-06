//
//  SymptomTC.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/17/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class SymptomTC: UITableViewController, UISearchResultsUpdating {
    
    var chosenSymp: [String] = [String]()
    var thing: [String] = [String]()
    
    var num = 0
    var filteredNFLTeams: [String]?
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredNFLTeams = unfilteredNFLTeams?.filter { team in
                return team.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredNFLTeams = unfilteredNFLTeams
        }
        tableView.reloadData()
        
        var s = 0
        for i in filteredNFLTeams! {
            let b = IndexPath( row : s, section : 0)
            tableView.cellForRow(at: b)?.accessoryType = UITableViewCell.AccessoryType.none
            s += 1
        }
        
        if chosenSymp.count != 0 {
            
            for j in chosenSymp {
                var check = 0
                for i in filteredNFLTeams! {
                    if i  ==  j {
                        var x :IndexPath = IndexPath(row : check, section : 0)
                        tableView.cellForRow(at: x)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                        
                    }
                    check += 1
                }
            }
        }
    }
    
   
    
    var unfilteredNFLTeams: [String]?
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    
    override func viewDidLoad() {
        
        read()
        
        super.viewDidLoad()
       
        filteredNFLTeams = unfilteredNFLTeams
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
       
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let nflTeams = filteredNFLTeams else {
            return 0
        }
        
        
        
        return nflTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        if let nflTeams = filteredNFLTeams {
            let team = nflTeams[indexPath.row]
            cell.textLabel!.text = team
          //  cell.textLabel!.textColor  = UIColor.init(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.font = UIFont(name: "Verdana", size: 20)
             cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        
        
        return cell

    }
    
        
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var home : [Int] = [Int]()
      
        
       
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            print(filteredNFLTeams![indexPath.row])
            var check = 0
            for x in chosenSymp {
                
                if x  == filteredNFLTeams![indexPath.row] {
                    chosenSymp.remove(at: check)
                }
                check += 1
            }
            
        }else  {
            
      
             tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            chosenSymp.append(filteredNFLTeams![indexPath.row])
            if filteredNFLTeams!.count == unfilteredNFLTeams!.count {
            home.append(indexPath.row)
            }
            
            
            
            
            
            
        }
        
        
        show()
        //  print(chosenSymp)
    
    }
    
   
  
   
    func read() -> String {
        var contents = ""
        if let filepath = Bundle.main.path(forResource: "SymptomList", ofType: "txt") {
            do {
                 contents = try String(contentsOfFile: filepath)
                thing = contents.components(separatedBy: "\n")
                unfilteredNFLTeams = contents.components(separatedBy: "\n")
               // unfilteredNFLTeams = unfilteredNFLTeams?.sorted()
               // unfilteredNFLTeams?.remove(at: 0)
                //unfilteredNFLTeams!.sorted()
                
              
                //print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        return contents
       /* for i in 0...unfilteredNFLTeams!.count - 1 {
            unfilteredNFLTeams![i] = unfilteredNFLTeams![i].replacingOccurrences(of: "_", with: " ")
        }*/
        
        //unfilteredNFLTeams! = unfilteredNFLTeams!.sorted()
        //unfilteredNFLTeams?.remove(at: 0)
    }
    
    
    
    
    
    
    func show(){
    var hello : String = ""
        if chosenSymp.count != 0 {
    for s in 0...( chosenSymp.count - 1 ) {
    for g in 0...(thing.count - 1 ) {
    if(chosenSymp[s] == thing[g]) {
    hello += String(g) + " "
    }
    }
    }
        }
    print(hello)
    let fileName = "mathStuff"
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
        print("Read from the file: \(inString)")
    }
    
        let s = Symptom()
        s.symptomReader()
        s.needThis()
}

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

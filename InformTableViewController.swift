//
//  InformTableViewController.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 6/17/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class InformTableViewController: UITableViewController {

    var chosen = ""
     var testType : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testType = forReading(name: "DiseaseList").components(separatedBy: "\n")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return testType!.count
    }

    func forReading(name : String) -> String {
        var contents = ""
        if let filepath = Bundle.main.path(forResource: name, ofType: "txt") {
            do {
                contents = try String(contentsOfFile: filepath)
                
                
                
                // print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        return contents
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diseaseName", for: indexPath)

        if let nflTeams = testType{
            let team = nflTeams[indexPath.row]
            cell.textLabel!.text = team
            //  cell.textLabel!.textColor  = UIColor.init(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = UIFont(name: "Verdana", size: 20)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
        return cell
    }
    
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            let d = UserDefaults.standard
            d.set(testType![indexPath.row], forKey: "name")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "inform") as! DiseaseViewController
        self.present(nextViewController, animated:true, completion:nil)
            
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DiseaseViewController {
            
            let displayVC = segue.destination as! DiseaseViewController
            
            
           displayVC.diseaseName = chosen
            
            
            
            
        }
        
        
        
    }*/
    

}

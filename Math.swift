//
//  Math.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/7/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class Math{

  
    func sigmoid( x : Double) -> Double{
        let e : Double = pow(2.71828, ( 1 * x ))
       // print(String(1.0 / (1.0 + e)))
        return 1.0 / (1.0 + e)
    }
    
    func largest(set : [Double]) -> Int {
        var check = 0
        var val : Double = 0.0
        var place = 0
        for i in 0...(set.count - 1 ) {
            if set[i] == 0.0 {
                check += 1
            } else if set[i] > val {
                val = set[i]
                place = i
            }
        }
        return place
        
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

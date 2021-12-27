//
//  UIAlertcontrol.swift
//  ECE564_HW
//
//  Created by Loaner on 9/23/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit
extension tablemainview{
    
    func alert(){
        let alert = UIAlertController(title:"Do you want to retrieve all the information?", message: "You can update all the information by downloading from the server.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Yes", style:.default, handler: { UIAlertAction in
            print("download")
            self.dukeperson.removeAll()
            self.sessiondownload() //dukeperson
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.viewDidAppear(true)
            }
            print("hello")

            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

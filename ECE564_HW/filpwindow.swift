//
//  filpwindow.swift
//  ECE564_HW
//
//  Created by Loaner on 10/9/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit

class FlipViewController:UIViewController{
    
    var personnetid = String()
    var persondescription = String()
    var personfirstname = String()
    var personlastname = String()
    let flipbackbutton = UIButton()
    let netidbutton = UIButton()
    let textdescription = UITextView()
    let labelfirstname = UIStrokeAnimatedLabel()
    let labellastname = UIStrokeAnimatedLabel()
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor.white
        //view.addSubview(flipbackbutton)
        flipbackbutton.frame = CGRect(x: 20, y: 70, width: 100, height: 50)
        flipbackbutton.backgroundColor = .darkGray
        flipbackbutton.layer.cornerRadius = 5
        flipbackbutton.setTitle("Flip Back", for:.normal)
        flipbackbutton.isHidden = false
        flipbackbutton.addTarget(self, action:#selector(flipbackbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(flipbackbutton)
        
        
        labelfirstname.frame = CGRect(x: 60, y: 200, width: 200, height: 150)
        labelfirstname.text = personfirstname
        labelfirstname.font = labelfirstname.font?.withSize(60)
        //labelfirstname.textColor = .white
        view.addSubview(labelfirstname)
        
        labellastname.frame = CGRect(x: 50, y: 300, width: 300, height: 150)
        labellastname.text = personlastname
        labellastname.font = labellastname.font?.withSize(70)
        //labellastname.textColor = .white
        view.addSubview(labellastname)
        
        netidbutton.frame = CGRect(x: 20, y: 150, width: 100, height: 50)
        netidbutton.backgroundColor = .darkGray
        netidbutton.layer.cornerRadius = 5
        netidbutton.setTitle(personnetid, for:.normal)
        netidbutton.isHidden = false
        //netidbutton.addTarget(self, action:#selector(flipbackbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(netidbutton)
        
        
        textdescription.frame = CGRect(x: 30, y: 480, width: 300, height: 150)
        textdescription.layer.cornerRadius = 5
        textdescription.backgroundColor = .white
        textdescription.textAlignment = .natural
        textdescription.text = persondescription
        textdescription.font = textdescription.font?.withSize(17)
        textdescription.isEditable = false
        textdescription.alwaysBounceVertical = true
        view.addSubview(textdescription)
        
        
        self.view = view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .flipHorizontal
        labelfirstname.animationDuration = 3.0
        labellastname.animationDuration = 4.0

        labelfirstname.strokeWidth = .relative(scale: 1.4)
        labellastname.strokeColor = .gray
        labelfirstname.characterSpacing = .absolute(value: 20.0)
        labellastname.wordSpacing = .relative(scale: 0.5)

        labellastname.animationEnabled = true
        
        labellastname.completionHandler = {
          print("Animation complete")
        }
}
    
    @objc func flipbackbuttonClicked(_ : UIButton){
        
        dismiss(animated: true, completion: nil)

    }
}

//
//  initiallizeinformationview.swift
//  ECE564_HW
//
//  Created by Loaner on 10/9/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit
extension InformationViewController{
    override func loadView() {
// You can change color scheme if you wis
//title label
        let view = UIView()
        //view.backgroundColor = .black
        view.backgroundColor = UIColor(red: 0/255, green: 48/255, blue: 135/255, alpha: 1)
        label.frame = CGRect(x: 100, y: 20, width: 200, height: 30)
        label.text = "ECE 564 Information"
        label.font = label.font.withSize(20)
        label.textColor = .white
        view.addSubview(label)
        self.view = view
        
// You can add code here
        
        
//other UIlabel
        //netID
        
        labelnetid.frame = CGRect(x: 30, y: 65, width: 100, height: 45)
        labelnetid.text = "NetID:"
        labelnetid.textColor = .white
        view.addSubview(labelnetid)
        
        //first name
        
        labelfirstname.frame = CGRect(x: 30, y: 90, width: 100, height: 45)
        labelfirstname.text = "First name:"
        labelfirstname.textColor = .white
        view.addSubview(labelfirstname)
        
        //last name
        
        labellastname.frame = CGRect(x: 30, y: 115, width: 100, height: 45)
        labellastname.text = "Last name:"
        labellastname.textColor = .white
        view.addSubview(labellastname)
        
        //from
        
        labelfrom.frame = CGRect(x: 30, y: 140, width: 100, height: 45)
        labelfrom.text = "From:"
        labelfrom.textColor = .white
        view.addSubview(labelfrom)
        
        //color switch
        colorswitch.frame = CGRect(x:310, y:635, width:0,height: 0)
        colorswitch.tintColor = UIColor.black
        colorswitch.addTarget(self, action: #selector(switchOneValueChanged(sender:)), for: .valueChanged)
        view.addSubview(colorswitch)
        
        //team number
        labelteam.frame = CGRect(x: 30, y: 165, width: 100, height: 45)
        labelteam.text = "Team:"
        labelteam.textColor = .white
        view.addSubview(labelteam)
        
        //degree
        /*
        labeldegree.frame = CGRect(x: 30, y: 175, width: 100, height: 45)
        labeldegree.text = "Degree:"
        labeldegree.textColor = .white
        view.addSubview(labeldegree)
        */
        //hobbies
        labelhobbies.frame = CGRect(x: 30, y: 215, width: 100, height: 45)
        labelhobbies.text = "Hobbies:"
        labelhobbies.textColor = .white
        view.addSubview(labelhobbies)
        
        //languages
        labellanguages.frame = CGRect(x: 30, y: 240, width: 100, height: 45)
        labellanguages.text = "Languages:"
        labellanguages.textColor = .white
        view.addSubview(labellanguages)
        
        //instructions
        labelinstructions.frame = CGRect(x: 30, y: 270, width: 350, height: 30)
        labelinstructions.text = "hobbies and languages are seperated by , end blank"
        labelinstructions.textColor = .white
        labelinstructions.font = labelinstructions.font.withSize(12)
        view.addSubview(labelinstructions)
        
        
        
//textinput UItextfield
        
        // netID textinput
        
        textnetid.frame = CGRect(x: 140, y: 75, width: 200, height: 25)
        textnetid.text = ""
        textnetid.inputView = UIView()
        textnetid.borderStyle = UITextField.BorderStyle.roundedRect
        textnetid.textColor = .black
        textnetid.clearButtonMode = UITextField.ViewMode.whileEditing
        textnetid.isUserInteractionEnabled = false
        view.addSubview(textnetid)
        
        // firstname textinput
        
        textfirstname.frame = CGRect(x: 140, y: 100, width: 200, height: 25)
        textfirstname.text = ""
        textfirstname.inputView = UIView()
        textfirstname.borderStyle = UITextField.BorderStyle.roundedRect
        textfirstname.textColor = .black
        textfirstname.clearButtonMode = UITextField.ViewMode.whileEditing
        textfirstname.isUserInteractionEnabled = false
        view.addSubview(textfirstname)
        
        // lastname textinput
        
        textlastname.frame = CGRect(x: 140, y: 125, width: 200, height: 25)
        textlastname.text = ""
        textlastname.inputView = UIView()
        textlastname.borderStyle = UITextField.BorderStyle.roundedRect
        textlastname.clearButtonMode = UITextField.ViewMode.whileEditing
        textlastname.textColor = .black
        textlastname.isUserInteractionEnabled = false
        view.addSubview(textlastname)
        
        // wherefrom textinput
        
        textfrom.frame = CGRect(x: 140, y: 150, width: 200, height: 25)
        //textfrom.text = ""
        textfrom.inputView = UIView()
        textfrom.borderStyle = UITextField.BorderStyle.roundedRect
        textfrom.clearButtonMode = UITextField.ViewMode.whileEditing
        textfrom.textColor = .black
        textfrom.isUserInteractionEnabled = false
        view.addSubview(textfrom)
        
        //team number
        textteam.frame = CGRect(x: 140, y: 175, width: 200, height: 25)
        textteam.text = ""
        textteam.inputView = UIView()
        textteam.borderStyle = UITextField.BorderStyle.roundedRect
        textteam.clearButtonMode = UITextField.ViewMode.whileEditing
        textteam.isUserInteractionEnabled = false
        textteam.textColor = .black
        //textteam.allowsEditingTextAttributes = false
        view.addSubview(textteam)
        
        //degree
        /*
        textdegree.frame = CGRect(x: 140, y: 185, width: 200, height: 25)
        textdegree.text = ""
        textdegree.inputView = UIView()
        textdegree.borderStyle = UITextField.BorderStyle.roundedRect
        textdegree.clearButtonMode = UITextField.ViewMode.whileEditing
        textdegree.textColor = .black
        textdegree.isUserInteractionEnabled = true
        view.addSubview(textdegree)
        */
        // hobbies textinput
        texthobbies.frame = CGRect(x: 140, y: 225, width: 200, height: 25)
        //texthobbies.text = ""
        texthobbies.inputView = UIView()
        texthobbies.borderStyle = UITextField.BorderStyle.roundedRect
        texthobbies.clearButtonMode = UITextField.ViewMode.whileEditing
        texthobbies.textColor = .black
        texthobbies.isUserInteractionEnabled = false
        view.addSubview(texthobbies)
        
        // languages textinput
        textlanguages.frame = CGRect(x: 140, y: 250, width: 200, height: 25)
        //textlanguages.text = ""
        textlanguages.inputView = UIView()
        textlanguages.borderStyle = UITextField.BorderStyle.roundedRect
        textlanguages.clearButtonMode = UITextField.ViewMode.whileEditing
        textlanguages.textColor = .black
        textlanguages.isUserInteractionEnabled = false
        view.addSubview(textlanguages)
        
        
// segment control
        //gender
        
        gendercontrol.frame = CGRect(x: 30, y: 300, width: 310, height: 30)
        gendercontrol.layer.cornerRadius = 5
        gendercontrol.backgroundColor = .lightGray
        gendercontrol.isUserInteractionEnabled = false
        view.addSubview(gendercontrol)
        
        //rolecontrol
        
        rolecontrol.frame = CGRect(x: 30, y: 340, width: 310, height: 30)
        rolecontrol.layer.cornerRadius = 5
        rolecontrol.backgroundColor = .lightGray
        rolecontrol.isUserInteractionEnabled = false
        view.addSubview(rolecontrol)
        
        //levelcontrol
        
        levelcontrol.frame = CGRect(x: 30, y: 380, width: 310, height: 30)
        levelcontrol.layer.cornerRadius = 5
        levelcontrol.backgroundColor = .lightGray
        levelcontrol.isUserInteractionEnabled = false
        //let font = UIFont.systemFont(ofSize: 10)
        //levelcontrol.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        view.addSubview(levelcontrol)
    
//button
        //edit
        
        addupdatebutton.frame = CGRect(x: 30, y: 420, width: 100, height: 50)
        addupdatebutton.backgroundColor = .darkGray
        addupdatebutton.layer.cornerRadius = 5
        addupdatebutton.setTitle("Edit", for:.normal)
        addupdatebutton.isHidden = false
        addupdatebutton.addTarget(self, action:#selector(editbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(addupdatebutton)
        
        savebutton.frame = CGRect(x: 30, y: 420, width: 100, height: 50)
        savebutton.backgroundColor = .darkGray
        savebutton.layer.cornerRadius = 5
        savebutton.isHidden = true
        savebutton.setTitle("Save", for:.normal)
        savebutton.addTarget(self, action:#selector(addupdatebuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(savebutton)
        
        
        flipbutton.frame = CGRect(x: 150, y: 420, width: 100, height: 50)
        flipbutton.backgroundColor = .darkGray
        flipbutton.layer.cornerRadius = 5
        flipbutton.tintColor = .lightGray
        flipbutton.setTitle("Flip", for :.normal)
        flipbutton.addTarget(self, action:#selector(flipbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(flipbutton)
//        //Find
//
//        findbutton.frame = CGRect(x: 200, y: 405, width: 65, height: 50)
//        findbutton.backgroundColor = .darkGray
//        findbutton.layer.cornerRadius = 5
//        findbutton.tintColor = .lightGray
//        findbutton.setTitle("Find", for :.normal)
//        findbutton.addTarget(self, action:#selector(findbuttonClicked(_ :)), for: .touchUpInside)
//        view.addSubview(findbutton)
        
        //Clear
        
        clearbutton.frame = CGRect(x: 270, y: 420, width: 65, height: 50)
        clearbutton.backgroundColor = .darkGray
        clearbutton.layer.cornerRadius = 5
        clearbutton.tintColor = .lightGray
        clearbutton.setTitle("Clear", for :.normal)
        clearbutton.isHidden = true
        clearbutton.addTarget(self, action:#selector(clearbuttonClicked(_ :)), for: .touchUpInside)
        
        view.addSubview(clearbutton)
        
        //image
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        let defaultimage = defaultpicture.toImage()
        self.chosenimage = defaultimage!
        picturebutton.setImage(defaultimage, for: .normal)
        picturebutton.frame = CGRect(x: 30, y: 480, width: 90, height: 80)
        picturebutton.addTarget(self, action:#selector(picturebuttonClicked), for: .touchUpInside)
        picturebutton.isUserInteractionEnabled = false
        view.addSubview(picturebutton)
//textview
        //description
        
        textdescription.frame = CGRect(x: 130, y: 480, width: 205, height: 150)
        textdescription.layer.cornerRadius = 5
        textdescription.backgroundColor = .white
        textdescription.textAlignment = .natural
        textdescription.text = "description will display"
        textdescription.font = textdescription.font?.withSize(17)
        textdescription.isEditable = false
        textdescription.alwaysBounceVertical = true
        view.addSubview(textdescription)
        
        //email
        
        
        textemail.frame = CGRect(x: 30, y: 570, width: 90, height: 60)
        textemail.layer.cornerRadius = 5
        textemail.backgroundColor = .white
        textemail.textAlignment = .natural
        textemail.text = "email will display"
        textemail.font = textemail.font?.withSize(13)
        textemail.isEditable = false
        textdescription.alwaysBounceHorizontal = true
        view.addSubview(textemail)
        
        if flagtableview == 1 {
            displayperson(eachperson: persondisplayobject)
        }
        else if flagtableview == 2 {
            displayperson(eachperson: persondisplayobject)
            addupdatebutton.isHidden = true //edit
            savebutton.isHidden = false
            textnetid.isUserInteractionEnabled = true
            textfirstname.allowsEditingTextAttributes = true
            textlastname.allowsEditingTextAttributes = true
            textfrom.allowsEditingTextAttributes = true
            textteam.allowsEditingTextAttributes = true
            textlanguages.allowsEditingTextAttributes = true
            texthobbies.allowsEditingTextAttributes = true
            rolecontrol.isUserInteractionEnabled = true
            gendercontrol.isUserInteractionEnabled = true
            levelcontrol.isUserInteractionEnabled = true
            textfrom.isUserInteractionEnabled = true
            textfirstname.isUserInteractionEnabled = true
            textlastname.isUserInteractionEnabled = true
            textteam.isUserInteractionEnabled = true
            texthobbies.isUserInteractionEnabled = true
            textlanguages.isUserInteractionEnabled = true
            clearbutton.isHidden = false
            picturebutton.isUserInteractionEnabled = true
        }
        else{
            addupdatebutton.isHidden = true //edit
            savebutton.isHidden = false
            textnetid.isUserInteractionEnabled = true
            textfirstname.allowsEditingTextAttributes = true
            textlastname.allowsEditingTextAttributes = true
            textfrom.allowsEditingTextAttributes = true
            textteam.allowsEditingTextAttributes = true
            textlanguages.allowsEditingTextAttributes = true
            texthobbies.allowsEditingTextAttributes = true
            rolecontrol.isUserInteractionEnabled = true
            gendercontrol.isUserInteractionEnabled = true
            levelcontrol.isUserInteractionEnabled = true
            textfrom.isUserInteractionEnabled = true
            textfirstname.isUserInteractionEnabled = true
            textlastname.isUserInteractionEnabled = true
            textteam.isUserInteractionEnabled = true
            texthobbies.isUserInteractionEnabled = true
            textlanguages.isUserInteractionEnabled = true
            clearbutton.isHidden = false
        }
    }
}

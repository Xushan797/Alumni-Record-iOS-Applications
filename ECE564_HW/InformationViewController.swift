//
//  InformationViewController.swift
//  ECE564_HW
//
//  Created by Loaner on 2021/9/7.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit


class InformationViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var persondisplayobject = DukePerson()
    var flagtableview = 0
    var dukeperson = [DukePerson]()
    // initialize
    let colorswitch = UISwitch()
    let label = UILabel()
    let labelnetid = UILabel()
    let labelfirstname = UILabel()
    let labellastname = UILabel()
    let labelfrom = UILabel()
    let labelteam = UILabel()
    let labeldegree = UILabel()
    let labelhobbies = UILabel()
    let labellanguages = UILabel()
    let labelinstructions = UILabel()
    
    let textnetid = UITextField()
    let textfirstname = UITextField()
    let textlastname = UITextField()
    let textfrom = UITextField()
    let textteam = UITextField()
    let textdegree = UITextField()
    let textdepartment = UITextField()
    let texthobbies = UITextField()
    let textlanguages = UITextField()
    let gendercontrol = UISegmentedControl(items: ["Male","Female","Non-binary"])
    let rolecontrol = UISegmentedControl(items: ["Prof","TA","Student"])
    let levelcontrol = UISegmentedControl(items: ["Undergrad","Grad","NA"])
    let addupdatebutton = UIButton()
    let savebutton = UIButton()
    //let findbutton = UIButton()
    let clearbutton = UIButton()
    let flipbutton = UIButton()
    var picturebutton  = UIButton()
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    let textdescription = UITextView()
    let textemail = UITextView()
    let image = UIImage()
    var chosenimage = UIImage()
    let imageView = UIImageView()

// You can add code here
    func displayperson(eachperson:DukePerson){
        //addupdatebutton.setTitle("Edit", for:.normal)
        textfirstname.text = eachperson.firstName
        textlastname.text = eachperson.lastName
        textfrom.text = eachperson.whereFrom
        textnetid.text = eachperson.netid
        //print(eachperson)
        let imagename = eachperson.imagename
        let image = imagename.toImage()
        self.chosenimage = image!
        self.picturebutton.setImage(image, for: .normal)
        var hobbiytext = ""

        for i in 0..<eachperson.hobbies.count-1 {
            hobbiytext = hobbiytext + eachperson.hobbies[i] + ","
        }
        hobbiytext = hobbiytext + eachperson.hobbies[eachperson.hobbies.count-1]
        texthobbies.text = hobbiytext
        var languagetext = ""

        for i in 0..<eachperson.languages.count-1 {
            languagetext = languagetext + eachperson.languages[i] + ","
        }
        languagetext = languagetext + eachperson.languages[eachperson.languages.count-1]
        textlanguages.text = languagetext
        textdescription.text = eachperson.description
        textemail.text = eachperson.netid + "@duke.edu"
        textteam.text = eachperson.team
        textdepartment.text = eachperson.department


        switch eachperson.dukerole {
        case DukeRole.Professor:
            self.rolecontrol.selectedSegmentIndex = 0
        case DukeRole.TA:
            self.rolecontrol.selectedSegmentIndex = 1
        case DukeRole.Student:
            self.rolecontrol.selectedSegmentIndex = 2
        default:
            self.rolecontrol.selectedSegmentIndex = 2
        }
        
        switch eachperson.dukelevel {
        case Dukelevel.Undergrad:
            self.levelcontrol.selectedSegmentIndex = 0
        case Dukelevel.Grad:
            self.levelcontrol.selectedSegmentIndex = 1
        case Dukelevel.Other:
            self.levelcontrol.selectedSegmentIndex = 2
        default:
            self.levelcontrol.selectedSegmentIndex = 2
        }

        switch eachperson.gender {
        case Gender.Male:
            self.gendercontrol.selectedSegmentIndex = 0
        case Gender.Female:
            self.gendercontrol.selectedSegmentIndex = 1
        case Gender.NonBinary:
            self.gendercontrol.selectedSegmentIndex = 2
        default:
            self.gendercontrol.selectedSegmentIndex = 0
        }
    }
    @objc func switchOneValueChanged(sender: UISwitch) {
        if sender.isOn == true {
            view.backgroundColor = UIColor(red: 173/255, green: 150/255, blue: 230/255, alpha: 1)
            //173, 216, 230)
        }
        else{
            view.backgroundColor = UIColor(red: 0/255, green: 48/255, blue: 135/255, alpha: 1)
        }
        
    }
    @objc func editbuttonClicked(_ : UIButton){
        //savebutton.setTitle("Save", for:.normal)
        addupdatebutton.isHidden = true
        savebutton.isHidden = false
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
        picturebutton.isUserInteractionEnabled = true
        clearbutton.isHidden = false
    }
    
    @objc func addupdatebuttonClicked(_ : UIButton){
        print("startadd")
        print(dukeperson)
        // add up or update people
        // If the input matches first and last name of someone in database, we have to modify their information in database
        // If no one matches, we add new people to the database
        textfirstname.isUserInteractionEnabled = false
        textlastname.isUserInteractionEnabled = false
        textfrom.isUserInteractionEnabled = false
        textteam.isUserInteractionEnabled = false
        textlanguages.isUserInteractionEnabled = false
        texthobbies.isUserInteractionEnabled = false
        rolecontrol.isUserInteractionEnabled = false
        picturebutton.isUserInteractionEnabled = false
        self.gendercontrol.isUserInteractionEnabled = false
        self.levelcontrol.isUserInteractionEnabled = false
        savebutton.isHidden = true
        addupdatebutton.isHidden = false
        clearbutton.isHidden = true
        let person = getperson()
        if person.netid == "" {
            textdescription.text = "Please enter the netID"
        }
        else if person.firstName == "" || person.lastName == "" {
            textdescription.text = "Please enter the first and last name of the person"
        }
        else if person.whereFrom == ""{
            textdescription.text = "Please enter where the person is from"
        }
        else if person.hobbies == [""]{
            textdescription.text = "Please enter the hobbies of the person"
        }
        else if person.hobbies.count > 3{
            textdescription.text = "Please enter hobbies less or equal than 3"
        }
        else if person.languages == [""]{
            textdescription.text = "Please enter the languages the person uses"
        }
        else if person.languages.count > 3{
            textdescription.text = "Please enter languages less or equal than 3"
        }
        else if self.gendercontrol.selectedSegmentIndex == UISegmentedControl.noSegment {
            textdescription.text = "Please choose A gender"
        }
        else if self.rolecontrol.selectedSegmentIndex == UISegmentedControl.noSegment {
            textdescription.text = "Please choose A role"
        }
        else if self.levelcontrol.selectedSegmentIndex == UISegmentedControl.noSegment {
            textdescription.text = "Please choose A education level"
        }
        
        
        else {
            var flag1 = 0
            //print(person.hobbies)
            for index in 0..<dukeperson.count {
                let eachperson = dukeperson[index]
                //print(eachperson.firstName)
                //print(eachperson.lastName)
                if person.netid == "xq47" {
                    sessionUpload(eachperson: person)
                }
                if eachperson.firstName == person.firstName && eachperson.lastName == person.lastName {
                    dukeperson.remove(at: index)
                    dukeperson.append(person)
                    let _ = DukePerson.savepersonInfo(dukeperson)
                    flag1 = 1
                    textdescription.text = "The description has been updated. \n" + person.description
                    textemail.text = person.netid + "@duke.edu"
                    self.chosenimage = person.imagename.toImage()!
                }
            }
            if flag1 == 0 {
                dukeperson.append(person)
                print("addup")
                print(dukeperson)
                let _ = DukePerson.savepersonInfo(dukeperson)

                textdescription.text = "New person added. \n" + person.description
        }
        
            
            //print(dukeperson)
        }
    }
    
//    @objc func findbuttonClicked(_ : UIButton){
//
//        // find matched duke people
//        let person = getperson()
//        var flag = 0
//        for index in 0..<dukeperson.count {
//            let eachperson = dukeperson[index]
//            if (eachperson.firstName == person.firstName && eachperson.lastName == person.lastName) || (eachperson.netid == person.netid.lowercased()) {
//                flag = 1
//                textfirstname.text = eachperson.firstName
//                textlastname.text = eachperson.lastName
//                textfrom.text = eachperson.whereFrom
//                textnetid.text = eachperson.netid
//                //print(eachperson)
//                let imagename = eachperson.imagename
//                let image = imagename.toImage()
//                self.chosenimage = image!
//                self.picturebutton.setImage(image, for: .normal)
//                var hobbiytext = ""
//
//                for i in 0..<eachperson.hobbies.count-1 {
//                    hobbiytext = hobbiytext + eachperson.hobbies[i] + ","
//                }
//                hobbiytext = hobbiytext + eachperson.hobbies[eachperson.hobbies.count-1]
//                texthobbies.text = hobbiytext
//                var languagetext = ""
//
//                for i in 0..<eachperson.languages.count-1 {
//                    languagetext = languagetext + eachperson.languages[i] + ","
//                }
//                languagetext = languagetext + eachperson.languages[eachperson.languages.count-1]
//                textlanguages.text = languagetext
//                textdescription.text = eachperson.description
//                textemail.text = eachperson.netid + "@duke.edu"
//                textteam.text = eachperson.team
//                textdepartment.text = eachperson.department
//
//
//                switch eachperson.dukerole {
//                case DukeRole.Professor:
//                    self.rolecontrol.selectedSegmentIndex = 0
//                case DukeRole.TA:
//                    self.rolecontrol.selectedSegmentIndex = 1
//                case DukeRole.Student:
//                    self.rolecontrol.selectedSegmentIndex = 2
//                default:
//                    self.rolecontrol.selectedSegmentIndex = 2
//                }
//
//                switch eachperson.dukelevel {
//                case Dukelevel.Undergrad:
//                    self.levelcontrol.selectedSegmentIndex = 0
//                case Dukelevel.Grad:
//                    self.levelcontrol.selectedSegmentIndex = 1
//                case Dukelevel.Other:
//                    self.levelcontrol.selectedSegmentIndex = 2
//                default:
//                    self.levelcontrol.selectedSegmentIndex = 2
//                }
//
//                switch eachperson.gender {
//                case Gender.Male:
//                    self.gendercontrol.selectedSegmentIndex = 0
//                case Gender.Female:
//                    self.gendercontrol.selectedSegmentIndex = 1
//                case Gender.NonBinary:
//                    self.gendercontrol.selectedSegmentIndex = 2
//                default:
//                    self.gendercontrol.selectedSegmentIndex = 0
//                }
//            }
//        }
//        if flag == 0{
//            textdescription.text = "This person is not found"
//        }
//
//    }
    @objc func flipbuttonClicked(_ : UIButton){
        let flipview = FlipViewController()
        if persondisplayobject.netid == "xq47" {
            let myfilpview = MyFlipViewController()
            myfilpview.personfirstname = persondisplayobject.firstName
            myfilpview.modalTransitionStyle = .flipHorizontal
            present(myfilpview, animated: true)
        }
        flipview.personnetid = persondisplayobject.netid
        flipview.persondescription = persondisplayobject.description
        flipview.personfirstname = persondisplayobject.firstName
        flipview.personlastname = persondisplayobject.lastName
        flipview.modalTransitionStyle = .flipHorizontal
        present(flipview, animated: true)

            

    }
    
    @objc func clearbuttonClicked(_ : UIButton){
        //textnetid.text = ""
        textfirstname.text = ""
        textlastname.text = ""
        texthobbies.text = ""
        textfrom.text = ""
        textteam.text = ""
        textdepartment.text = ""
        textlanguages.text = ""
        texthobbies.text = ""
        textdescription.text = ""
        textemail.text = ""
        
         let imagename = defaultpicture
        let image = imagename.toImage()
        self.picturebutton.setImage(image, for: .normal)

        self.gendercontrol.selectedSegmentIndex = UISegmentedControl.noSegment
        self.rolecontrol.selectedSegmentIndex = UISegmentedControl.noSegment
        self.levelcontrol.selectedSegmentIndex = UISegmentedControl.noSegment
    }
    
    @objc func picturebuttonClicked(){
        present(imagePicker, animated: true) {
            print("UIImagePickerController")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // get the information of the picture
        // get origin image
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("error: did not picked a photo")
        }
        //choose picture and close the view
        picker.dismiss(animated: true) { [unowned self] in
            // add a image view on self.view
            let smallImage = selectedImage.copy(newSize: CGSize(width: 144, height: 144))
            print("change picture")
            self.picturebutton.setImage(smallImage, for: .normal)
            if smallImage != nil {
                self.chosenimage = smallImage!
            }
            
            //let curpicturestring = stringFromImage(smallImage!)
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // click cancel
        picker.dismiss(animated: true) {
            print("UIImagePickerController: dismissed")
        }
    }
    func getperson() -> DukePerson{
        // after click add/ update or find button, we collect the information of this person
        let firstname = textfirstname.text ?? ""
        let lastname = textlastname.text ?? ""
        let wherefrom = textfrom.text ?? ""
        let netid = textnetid.text ?? ""
        var gender = Gender.NonBinary
        var role = DukeRole.Other
        var level = Dukelevel.Other
        let team = textteam.text ?? ""
        let department = textdepartment.text ?? ""
        let hobbies = texthobbies.text?.components(separatedBy: ",") ?? [""]
        let curimagestring = stringFromImage(self.chosenimage)
        let imagename = curimagestring
        let id = ""
        let languages = textlanguages.text?.components(separatedBy: ",") ?? [""]
        switch self.gendercontrol.selectedSegmentIndex {
            case 0:
                gender = Gender.Male
            case 1:
                gender = Gender.Female
            case 2:
                gender = Gender.NonBinary
            default:
                gender = Gender.Male
            }
        
        
        
        switch self.rolecontrol.selectedSegmentIndex {
            case 0:
                role = DukeRole.Professor
            case 1:
                role = DukeRole.TA
            case 2:
                role = DukeRole.Student
            default:
                role = DukeRole.Student
            }
        
        
        switch self.levelcontrol.selectedSegmentIndex {
            case 0:
                level = Dukelevel.Undergrad
            case 1:
                level = Dukelevel.Grad
            case 2:
                level = Dukelevel.Other
            default:
                level = Dukelevel.Other
            }
        
        return DukePerson(firstname: firstname, lastname: lastname, gender: gender, WhereFrom: wherefrom, hobbies:hobbies, languages:languages, dukerole: role, dukelevel: level,netid: netid, imagename: imagename,team: team, department: department,id: id)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.dukeperson = DukePerson.loadpersonInfo()!
        // Do any additional setup after loading the view.
        //print(dukepersondownload)
        //UIAlertController
    }
    
}


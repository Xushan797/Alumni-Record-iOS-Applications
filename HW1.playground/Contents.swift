//: This is the playground file to use for submitting HW1.  You will add your code where noted below.  Make sure you only put the code required at load time in the ``loadView()`` method.  Other code should be set up as additional methods (such as the code called when a button is pressed).
  
import UIKit
import PlaygroundSupport

public protocol CustomStringConvertible {
    var description: String { get }
}

enum Gender : String {
    case Male = "Male"
    case Female = "Female"
    case NonBinary = "Non-binary"
    case Notknown = "Not known"
}

class Person {
    var firstName = "First"
    var lastName = "Last"
    var whereFrom = "Anywhere"  // this is just a free String - can be city, state, both, etc.
    var gender : Gender = .Male
    var hobbies = ["none"]
    init() {}
    init(firstname:String,lastname:String,gender:Gender, WhereFrom:String,hobbies:[String]) {
        self.firstName = firstname
        self.lastName = lastname
        self.gender = gender
        self.whereFrom = WhereFrom
        self.hobbies = hobbies
    }
}

enum DukeRole : String {
    case Student = "student"
    case Professor = "professor"
    case TA = "teaching assistant"
    case Other = "unknown"
}

enum Dukelevel : String{
    case Undergrad = "undergraduate"
    case Grad = "graduate"
    case NA = "not applicable"
    case Other = "unknown"
}
protocol ECE564 {
    var degree : String { get }
    var languages: [String] { get }
    var team : String { get }
}

// You can add code here
class DukePerson: Person,ECE564,CustomStringConvertible {
    var dukerole = DukeRole.Other
    var dukelevel = Dukelevel.NA
    var languages: [String] = []
    override init() {
        super.init()
    }
    init(firstname:String, lastname:String, gender:Gender, WhereFrom:String,hobbies:[String],languages: [String], dukerole:DukeRole,dukelevel:Dukelevel) {
        self.dukerole = dukerole
        self.dukelevel = dukelevel
        self.languages = languages
        super.init(firstname: firstname, lastname: lastname, gender: gender, WhereFrom: WhereFrom, hobbies: hobbies)
    }
    var degree: String = ""
    
    var team: String = ""
    var description: String {
        var genderdescription : String
        switch gender {
        case .Male:
            genderdescription = "He is a "
        case .Female:
            genderdescription = "She is a "
        case .NonBinary:
            genderdescription = "They are "
        case .Notknown:
            genderdescription = "They are "
        }
        var hobbiydescription = ""
        
        for i in 0..<hobbies.count {
            hobbiydescription = hobbiydescription + hobbies[i] + ", "
        }
        
        var languagedescrition = ""
        for i in 0..<languages.count {
            languagedescrition = languagedescrition + languages[i] + ", "
        }
        
        return ("\(firstName) \(lastName) is from \(whereFrom). " + genderdescription + dukerole.rawValue + ", the degree is "+dukelevel.rawValue + ", likes " + hobbiydescription + "and uses " + languagedescrition + "in class." )
    }
    
    
    
    
    
}
class HW1ViewController : UIViewController {
    
    // initialize
    let label = UILabel()
    let labelfirstname = UILabel()
    let labellastname = UILabel()
    let labelfrom = UILabel()
    let labelhobbies = UILabel()
    let labellanguages = UILabel()
    let labelinstructions = UILabel()
    let textfirstname = UITextField()
    let textlastname = UITextField()
    let textfrom = UITextField()
    let texthobbies = UITextField()
    let textlanguages = UITextField()
    let gendercontrol = UISegmentedControl(items: ["Male","Female","Non-binary"])
    let rolecontrol = UISegmentedControl(items: ["Prof","TA","Student"])
    let levelcontrol = UISegmentedControl(items: ["Undergrad","Grad","NA"])
    let addupdatebutton = UIButton()
    let findbutton = UIButton()
    let clearbutton = UIButton()
    let textdescription = UITextView()
    
    //dukepeople database
    // for Abhijay Suhag, languages: Typescript,Swift,Java
    var dukepeople :[DukePerson] = [DukePerson(firstname: "Xushan", lastname: "Qing", gender:.Female, WhereFrom: "Chengdu, China", hobbies: ["singing","hiking"], languages: ["python", "C++", "Swift"], dukerole: .Student, dukelevel: .Grad),DukePerson(firstname: "Richard", lastname: "Telford", gender: .Male, WhereFrom: "Chatham Country, NC", hobbies: ["swimming","biking", "reading"],languages: ["C", "C++", "Swift"], dukerole: .Professor, dukelevel: .NA),DukePerson(firstname: "Abhijay", lastname: "Suhag", gender: .Male, WhereFrom: "Augusta, Georgia", hobbies: ["hiking","gaming","playing tennis"], languages: ["Typescript", "Java", "Swift"], dukerole: .TA, dukelevel: .Undergrad),DukePerson(firstname: "Andrew", lastname: "Krier", gender: .Male, WhereFrom: "Saint Paul, Minnesota", hobbies: ["basketball","frisbee"], languages: ["Python", "Java", "Swift"], dukerole: .TA, dukelevel: .Undergrad),DukePerson(firstname: "Boyi", lastname: "Wang", gender: .Female, WhereFrom: "Anshan, China", hobbies: ["running","hiking"], languages: ["Python", "Java", "C++"], dukerole: .Student, dukelevel: .Grad)]
    
    
    override func loadView() {
// You can change color scheme if you wis
//title label
       

        let view = UIView()
        view.backgroundColor = .black
        
        label.frame = CGRect(x: 100, y: 10, width: 200, height: 20)
        label.text = "ECE 564 Homework 1"
        label.textColor = .white
        view.addSubview(label)
        self.view = view
        
// You can add code here
        
//other UIlabel
        //first name
        
        labelfirstname.frame = CGRect(x: 70, y: 50, width: 100, height: 30)
        labelfirstname.text = "First name:"
        labelfirstname.textColor = .white
        view.addSubview(labelfirstname)
        self.view = view
        
        //last name
        
        labellastname.frame = CGRect(x: 70, y: 80, width: 100, height: 30)
        labellastname.text = "Last name:"
        labellastname.textColor = .white
        view.addSubview(labellastname)
        
        //from
        
        labelfrom.frame = CGRect(x: 70, y: 110, width: 100, height: 30)
        labelfrom.text = "From:"
        labelfrom.textColor = .white
        view.addSubview(labelfrom)
        
        //hobbies
        labelhobbies.frame = CGRect(x: 70, y: 140, width: 100, height: 30)
        labelhobbies.text = "Hobbies:"
        labelhobbies.textColor = .white
        view.addSubview(labelhobbies)
        
        //languages
        labellanguages.frame = CGRect(x: 70, y: 170, width: 100, height: 30)
        labellanguages.text = "Languages:"
        labellanguages.textColor = .white
        view.addSubview(labellanguages)
        
        //instructions
        labelinstructions.frame = CGRect(x: 70, y: 200, width: 250, height: 10)
        labelinstructions.text = "hobbies and languages are seperated by , "
        labelinstructions.textColor = .white
        labelinstructions.font = labelinstructions.font.withSize(10)
        view.addSubview(labelinstructions)
        
        
        
//textinput UItextfield
        // firstname textinput
        
        textfirstname.frame = CGRect(x: 170, y: 50, width: 130, height: 25)
        textfirstname.text = ""
        textfirstname.borderStyle = UITextField.BorderStyle.roundedRect
        textfirstname.textColor = .black
        textfirstname.allowsEditingTextAttributes = true
        view.addSubview(textfirstname)
        
        // lastname textinput
        
        textlastname.frame = CGRect(x: 170, y: 80, width: 130, height: 25)
        textlastname.text = ""
        textlastname.borderStyle = UITextField.BorderStyle.roundedRect
        textlastname.textColor = .black
        textlastname.allowsEditingTextAttributes = true
        view.addSubview(textlastname)
        
        // wherefrom textinput
        
        textfrom.frame = CGRect(x: 170, y: 110, width: 130, height: 25)
        //textfrom.text = ""
        textfrom.borderStyle = UITextField.BorderStyle.roundedRect
        textfrom.textColor = .black
        textfrom.allowsEditingTextAttributes = true
        view.addSubview(textfrom)
        
        // hobbies textinput
        texthobbies.frame = CGRect(x: 170, y: 140, width: 130, height: 25)
        //texthobbies.text = ""
        texthobbies.borderStyle = UITextField.BorderStyle.roundedRect
        texthobbies.textColor = .black
        texthobbies.allowsEditingTextAttributes = true
        view.addSubview(texthobbies)
        
        // languages textinput
        textlanguages.frame = CGRect(x: 170, y: 170, width: 130, height: 25)
        //textlanguages.text = ""
        textlanguages.borderStyle = UITextField.BorderStyle.roundedRect
        textlanguages.textColor = .black
        textlanguages.allowsEditingTextAttributes = true
        view.addSubview(textlanguages)
        
        
// segment control
        //gender
        
        gendercontrol.frame = CGRect(x: 70, y: 230, width: 230, height: 30)
        gendercontrol.layer.cornerRadius = 5
        gendercontrol.backgroundColor = .lightGray
        view.addSubview(gendercontrol)
        
        //rolecontrol
        
        rolecontrol.frame = CGRect(x: 70, y: 270, width: 230, height: 30)
        rolecontrol.layer.cornerRadius = 5
        rolecontrol.backgroundColor = .lightGray
        view.addSubview(rolecontrol)
        
        //levelcontrol
        
        levelcontrol.frame = CGRect(x: 70, y: 310, width: 230, height: 30)
        levelcontrol.layer.cornerRadius = 5
        levelcontrol.backgroundColor = .lightGray
        //let font = UIFont.systemFont(ofSize: 10)
        //levelcontrol.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        view.addSubview(levelcontrol)
    
//button
        //Add or Update
        
        addupdatebutton.frame = CGRect(x: 70, y: 350, width: 120, height: 50)
        addupdatebutton.backgroundColor = .darkGray
        addupdatebutton.layer.cornerRadius = 5
        addupdatebutton.setTitle("Add / Update", for:.normal)
        addupdatebutton.addTarget(self, action:#selector(addupdatebuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(addupdatebutton)
        
        //Find
        
        findbutton.frame = CGRect(x: 200, y: 350, width: 45, height: 50)
        findbutton.backgroundColor = .darkGray
        findbutton.layer.cornerRadius = 5
        findbutton.tintColor = .lightGray
        findbutton.setTitle("Find", for :.normal)
        findbutton.addTarget(self, action:#selector(findbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(findbutton)
        
        //Clear
        
        clearbutton.frame = CGRect(x: 255, y: 350, width: 45, height: 50)
        clearbutton.backgroundColor = .darkGray
        clearbutton.layer.cornerRadius = 5
        clearbutton.tintColor = .lightGray
        clearbutton.setTitle("Clear", for :.normal)
        clearbutton.addTarget(self, action:#selector(clearbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(clearbutton)

//textview
        //description
        
        textdescription.frame = CGRect(x: 70, y: 410, width: 230, height: 100)
        textdescription.layer.cornerRadius = 5
        textdescription.backgroundColor = .white
        textdescription.textAlignment = .natural
        textdescription.text = "description will display"
        textdescription.isEditable = false
        view.addSubview(textdescription)
        
        
    }
// You can add code here
    @objc func addupdatebuttonClicked(_ : UIButton){
        // add up or update people
        // If the input matches first and last name of someone in database, we have to modify their information in database
        // If no one matches, we add new people to the database
        
        let person = getperson()
        
        if person.firstName == "" || person.lastName == "" {
            textdescription.text = "Please enter the first and last name of the person"
        }
        else if person.whereFrom == ""{
            textdescription.text = "Please enter where the person is from"
        }
        else if person.hobbies == [""]{
            textdescription.text = "Please enter the hobbies of the person"
        }
        else if person.languages == [""]{
            textdescription.text = "Please enter the languages the person uses"
        }
        else {
            var flag = 0
            print(person.hobbies)
            for index in 0..<dukepeople.count {
                let eachperson = dukepeople[index]
                print(eachperson.firstName)
                print(eachperson.lastName)
                if eachperson.firstName == person.firstName && eachperson.lastName == person.lastName {
                    self.dukepeople.remove(at: index)
                    self.dukepeople.append(person)
                    flag = 1
                    textdescription.text = "The description has been updated. \n" + person.description
                }
            }
            if flag == 0 {
                self.dukepeople.append(person)
                textdescription.text = "New person added. \n" + person.description
        }
        
            
            print(dukepeople)
        }
    }
    
    @objc func findbuttonClicked(_ : UIButton){
        
        // find matched duke people
        let person = getperson()
        var flag = 0
        for index in 0..<dukepeople.count {
            let eachperson = dukepeople[index]
            if eachperson.firstName == person.firstName && eachperson.lastName == person.lastName {
                flag = 1
                textdescription.text = eachperson.description
            }
        }
        if flag == 0{
            textdescription.text = "This person is not found"
        }
        
    }
    
    @objc func clearbuttonClicked(_ : UIButton){
        textfirstname.text = ""
        textlastname.text = ""
        texthobbies.text = ""
        textfrom.text = ""
        textlanguages.text = ""
        texthobbies.text = ""
        textdescription.text = ""
        self.gendercontrol.selectedSegmentIndex = UISegmentedControl.noSegment
        self.rolecontrol.selectedSegmentIndex = UISegmentedControl.noSegment
        self.levelcontrol.selectedSegmentIndex = UISegmentedControl.noSegment
    }
    
    func getperson() -> DukePerson{
        // after click add/ update or find button, we collect the information of this person
        let firstname = textfirstname.text ?? ""
        let lastname = textlastname.text ?? ""
        let wherefrom = textfrom.text ?? ""
        var gender = Gender.NonBinary
        var role = DukeRole.Other
        var level = Dukelevel.Other
        let hobbies = texthobbies.text?.components(separatedBy: ",") ?? [""]
        
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
        
        
        return DukePerson(firstname: firstname, lastname: lastname, gender: gender, WhereFrom: wherefrom, hobbies:hobbies, languages:languages, dukerole: role, dukelevel: level)

        
        
        
    }
    
}


// Don't change the following line - it is what allows the view controller to show in the Live View window
PlaygroundPage.current.liveView = HW1ViewController()

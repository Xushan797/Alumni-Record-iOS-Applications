//
//  peopleitem.swift
//  ECE564_HW
//
//  Created by Loaner on 9/14/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit

public protocol CustomStringConvertible {
    var description: String { get }
}

enum Gender : String,Codable {
    case Male = "Male"
    case Female = "Female"
    case NonBinary = "Non-binary"
    case Notknown = "Not known"
}

class Person: NSObject,Codable{
    var firstName = "First"
    var lastName = "Last"
    var whereFrom = "Anywhere"  // this is just a free String - can be city, state, both, etc.
    var gender = Gender.Male
    var hobbies = ["none"]
    
    override init() {
        super.init()
    }
    init(firstname:String,lastname:String,gender:Gender, WhereFrom:String,hobbies:[String]) {
        
        self.firstName = firstname
        self.lastName = lastname
        self.gender = gender
        self.whereFrom = WhereFrom
        self.hobbies = hobbies
        
        super.init()
    }
}

enum DukeRole : String,Codable {
    case Student = "Student"
    case Professor = "Professor"
    case TA = "teaching assistant"
    case Other = "unknown"
}

enum Dukelevel : String,Codable{
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


class DukePerson: Person,ECE564,CustomStringConvertible  {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("ToDoJSONFile")
    var dukerole = DukeRole.Other
    var dukelevel = Dukelevel.NA
    var team = ""
    var email = ""
    var department = ""
    var id = ""
    var netid = ""
    var languages: [String] = []
    var imagename = "default.jpg"
    var degree: String = ""
    override init() {
        super.init()
    }
    init(firstname:String, lastname:String, gender:Gender, WhereFrom:String,hobbies:[String],languages: [String], dukerole:DukeRole,dukelevel:Dukelevel,netid:String,imagename:String,team:String,department:String,id:String) {
        
        self.dukerole = dukerole
        self.dukelevel = dukelevel
        self.languages = languages
        self.netid = netid
        self.email = self.netid + "@duke.edu"
        self.team = team
        self.department = department
        self.imagename = imagename
        self.id = id
        super.init(firstname: firstname, lastname: lastname, gender: gender, WhereFrom: WhereFrom, hobbies: hobbies)
    }
    
    enum CodingKeys: String, CodingKey {
            case dukerole,dukelevel,team,email,department,id,netid,languages,imagename,degree
        }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dukerole = try container.decode(DukeRole.self, forKey: .dukerole)
        dukelevel = try container.decode(Dukelevel.self, forKey: .dukelevel)
        team = try container.decode(String.self, forKey: .team)
        email = try container.decode(String.self, forKey: .email)
        languages = try container.decode([String].self, forKey: .languages)
        netid = try container.decode(String.self, forKey: .netid)
        department = try container.decode(String.self, forKey: .department)
        imagename = try container.decode(String.self, forKey: .imagename)
        id = try container.decode(String.self, forKey: .id)

        try super.init(from: decoder)
    }
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dukerole, forKey: .dukerole)
        try container.encode(dukelevel, forKey: .dukelevel)
        try container.encode(team, forKey: .team)
        try container.encode(email, forKey: .email)
        try container.encode(languages, forKey: .languages)
        try container.encode(netid, forKey: .netid)
        try container.encode(department, forKey: .department)
        try container.encode(imagename, forKey: .imagename)
        try container.encode(id, forKey: .id)
    }
    
    override var description: String {
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
        
        for i in 0..<hobbies.count-1 {
            hobbiydescription = hobbiydescription + hobbies[i] + ", "
        }
        hobbiydescription = hobbiydescription + hobbies[hobbies.count-1]
        
        var languagedescrition = ""
        for i in 0..<languages.count-1 {
            
            languagedescrition = languagedescrition + languages[i] + ", "
            //print(languagedescrition)
        }
        languagedescrition = languagedescrition + languages[languages.count-1]
        //print(languagedescrition)
        
        return ("\(firstName) \(lastName) is from \(whereFrom). " + "The netid is \(netid). " + genderdescription + dukerole.rawValue + ", the degree is "+dukelevel.rawValue + ", likes " + hobbiydescription + " and uses " + languagedescrition + " in class." )
    }
    
    static func savepersonInfo(_ dukepersonList: [DukePerson]) -> Bool {
        var outputData = Data()
        let encoder = JSONEncoder()
        //print("11")
        if let encoded = try? encoder.encode(dukepersonList) {
            if let json = String(data: encoded, encoding: .utf8) {
                //print(json)
                outputData = encoded
            }
            else { return false }
            
            do {
                    try outputData.write(to: ArchiveURL)
            } catch let error as NSError {
                print (error)
                return false
            }
            return true
        }
        else { return false }
    }
    static func loadpersonInfo() -> [DukePerson]? {
        let decoder = JSONDecoder()
        var personitems = [DukePerson]()
        let tempData: Data
        
        do {
            tempData = try Data(contentsOf: ArchiveURL)
            //let strx = String(data: tempData, encoding: String.Encoding.utf8)
            //print(strx)
        } catch let error as NSError {
            print("data loader")
            print(error)
            return nil
        }
//        print(decoding:tempData, encoding: .utf8)
        if let decoded = try? decoder.decode([DukePerson].self, from: tempData) {
            //print(decoded[0].netid)
            personitems = decoded
        }

        return personitems
    }
    
   
/*
 NOTE:  "xxx.self" evaluates to the value of the type. Use this form to access a type as a value. For example, because SomeClass.self evaluates to the SomeClass type itself, you can pass it to a function or method that accepts a type-level argument.  (From Swift Language Guide)
 */}


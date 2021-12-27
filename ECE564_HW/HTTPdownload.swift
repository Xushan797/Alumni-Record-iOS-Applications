//
//  HTTPdownload.swift
//  ECE564_HW
//
//  Created by Loaner on 9/23/21.
//  Copyright © 2021 ECE564. All rights reserved.
//


import Foundation

let dicrolemap = [
    "Student" : DukeRole.Student,
    "Professor" : DukeRole.Professor,
    "TA" : DukeRole.TA,
    "unknown" :DukeRole.Other,

] as [String : DukeRole]

let dicgendermap = [
    "Male" : Gender.Male,
    "Female" : Gender.Female,
    "Non-binary" : Gender.NonBinary,
    "Not known" : Gender.Notknown
]
let diclevelmap = [
    "undergraduate" : Dukelevel.Undergrad,
    "graduate" : Dukelevel.Grad,
    "not applicable" : Dukelevel.NA,
    "unknown" : Dukelevel.Other
]
class dicModel:Codable {
    let netid:String?
    let team:String?
    let id:String?
    let lastname:String?
    let department:String?
    let hobbies:[String]?
    let role:String?
    let languages:[String]?
    let wherefrom:String?
    let firstname: String?
    var degree:String?
    let gender:String?
    let email:String?
    var picture:String?
}
var dukepersondownload = [DukePerson]()
extension tablemainview:URLSessionDownloadDelegate {
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        dukepersondownload.removeAll()
        if let data = try? Data(contentsOf: location) {
            let todoItem = parseJSON(data: data)
                    //print(todoItem)
                    
                    for i in 0..<(todoItem!.count) {
                        let jsonperson = todoItem![i]
                        print(jsonperson)
                        if jsonperson.picture == nil {
                            jsonperson.picture = defaultpicture
                        }
                        let persondownload = DukePerson(firstname: jsonperson.firstname ?? "none", lastname: jsonperson.lastname ?? "none", gender:dicgendermap[jsonperson.gender ?? "Not known"] ?? Gender.Notknown, WhereFrom:jsonperson.wherefrom ?? "unknown", hobbies:jsonperson.hobbies ?? [""], languages: jsonperson.languages ?? [""], dukerole: dicrolemap[jsonperson.role ?? "unknown"] ?? DukeRole.Other, dukelevel: diclevelmap[jsonperson.degree ?? "unknown"] ?? Dukelevel.Other,netid: jsonperson.netid ?? "none",imagename: jsonperson.picture!,team: jsonperson.team ?? "",department: jsonperson.department ?? "",id: jsonperson.id ?? "")
                        dukepersondownload.append(persondownload)
                    }
                    let _ = DukePerson.savepersonInfo(dukepersondownload)
                    dukeperson.removeAll()
                   print("download duke person Json  RemoveAll" + String(dukeperson.count))
                    dukeperson = DukePerson.loadpersonInfo()!
                    print("download duke person Json" + String(dukeperson.count))
                 //   let _ = DukePerson.loadpersonInfo()
                   // print(dukepersondownload)
                    print("list")
               // Using parseJSON() function to convert data to Swift struct
        }
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let t = "Downloaded \(100*totalBytesWritten/totalBytesExpectedToWrite)%"
        // print(t)
        // add a percentage label to display
        DispatchQueue.main.async {
            self.downloadlabel.text = t
            self.downloadmessage = t
        }
    }
    
    func sessiondownload() {
    // Create URL
    let url = URL(string: "http://kitura-fall-2021.vm.duke.edu:5640/b64entries")
    //请求
    let request = URLRequest(url: url!)

    // Send HTTP Request
    let session: URLSession = {
                let config = URLSessionConfiguration.ephemeral
                config.allowsCellularAccess = false
                let session = URLSession(configuration: config, delegate: self, delegateQueue: .main)
                return session

            }()
    let task = session.downloadTask(with: request)
    task.resume()
}
    



    func parseJSON(data: Data) ->  [dicModel]? {
        //print(data)
        var returnValue:  [dicModel]?
        do {
            // print("indo  \(data)")
            returnValue = try JSONDecoder().decode( [dicModel].self, from: data)
        } catch {
            print("Error took place \(error).")
        }
        
        return returnValue
    }

}


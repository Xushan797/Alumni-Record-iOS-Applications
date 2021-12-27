//
//  HTTPupload.swift
//  ECE564_HW
//
//  Created by Loaner on 9/20/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation

func sessionUpload(eachperson:DukePerson){
    //上传地址
    let url = URL(string: "")
    //请求
    var request = URLRequest(url: url!)
    //write your own url
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("", forHTTPHeaderField: "Authorization")
    //write your own authorization
    let dic = ["firstname":eachperson.firstName,
               "lastname":eachperson.lastName,
               "wherefrom":eachperson.whereFrom,
               "gender":eachperson.gender.rawValue,
               "hobbies":eachperson.hobbies,
               "role":eachperson.dukerole.rawValue,
               "degree":eachperson.degree,
               "languages":eachperson.languages,
               "picture":eachperson.imagename,
               "team":eachperson.team,
               "netid":eachperson.netid,
               "email":eachperson.email,
               "department":eachperson.department,
               "id":eachperson.id] as [String : Any]
    let theJSONData = try? JSONSerialization.data(withJSONObject: dic ,options: [.prettyPrinted])
    
    //上传数据流
    request.httpBody = theJSONData
    let uploadTask = URLSession.shared.dataTask(with: request) {(data, response, error) in
    //上传完毕后
        
    if error != nil{
        print(error ?? "error toke place")
        return
    }
    do{
        let decoded = try JSONSerialization.jsonObject(with: theJSONData!, options: [])
            // here "decoded" is of type `AnyObject`, decoded from JSON data
        print("Response data:\n \(decoded)")
    }catch let jsonErr{
        print(jsonErr)
   }
    }

    //使用resume方法启动任务
    uploadTask.resume()
}

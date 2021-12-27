//
//  tablemainview.swift
//  ECE564_HW
//
//  Created by Loaner on 9/29/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit


class tablemainview: UITableViewController,UISearchBarDelegate {
    
    
    let downloadlabel = UILabel()
    var downloadmessage = String()

    var teamdict = [String:[DukePerson]]()  //每个team里面不同的人对象
    var teams = [String]() //team的名字
    var filterteamdict = [String:[DukePerson]]()
    var filterteams = [String]()
    var dukeperson = [DukePerson]()
    
    @IBOutlet var table_view: UITableView!
    @IBOutlet weak var retrievebutton: UIButton!
    @IBOutlet weak var addbutton: UIBarButtonItem!
    @IBOutlet weak var searchbar: UISearchBar!

    
    //dukepeople database
    
    func loadInitialData(){
        if let tempdukeperson = DukePerson.loadpersonInfo() {
            print(tempdukeperson.count)
            print("first")
            self.dukeperson = tempdukeperson
            print(dukeperson.count)
            for tmp: DukePerson in dukeperson {
                print(tmp.netid)
            }
        } else {
            print("hello")
            let item1 = DukePerson(firstname: "Xushan", lastname: "Qing", gender: .Female, WhereFrom: "Chengdu, China", hobbies: ["singing","hiking"], languages: ["python", "C++", "Swift"], dukerole: .Student, dukelevel: .Grad,netid: "xx47",imagename: XushanQingpicture,team: "",department: "ece",id: "")
            self.dukeperson.append(item1)

            let item2 = DukePerson(firstname: "Xushan", lastname: "Wang", gender: .Male, WhereFrom: "Chatham Country, NC", hobbies: ["swimming","biking", "reading"], languages: ["C", "C++", "Swift"], dukerole: .Professor, dukelevel: .NA,netid: "rr111",imagename: XushanQingpicture,team: "",department: "cs",id: "")
            self.dukeperson.append(item2)

            let item3 = DukePerson(firstname: "Xushan", lastname: "Li", gender: .Male, WhereFrom: "Augusta, Georgia", hobbies: ["hiking","gaming","playing tennis"], languages: ["Typescript", "Java", "Swift"], dukerole: .TA, dukelevel: .Undergrad,netid: "as111",imagename: XushanQingpicture,team: "",department: "ece",id: "")
            self.dukeperson.append(item3)


            let item4 = DukePerson(firstname: "Xushan", lastname: "Wu", gender: .Male, WhereFrom: "Saint Paul, Minnesota", hobbies: ["basketball","frisbee"], languages: ["Python", "Java", "Swift"], dukerole: .TA, dukelevel: .Undergrad,netid: "ak111",imagename:XushanQingpicture, team: "",department: "ece",id: "")
            self.dukeperson.append(item4)

            let item5 = DukePerson(firstname: "Bobi", lastname: "Li", gender: .Female, WhereFrom: "An, China", hobbies: ["running","hiking"], languages: ["Python", "Java", "C++"], dukerole: .Student, dukelevel: .Grad,netid: "bb442",imagename: BoyiWangpicture,team: "",department: "ece",id: "")
            self.dukeperson.append(item5)
            print("save firsttime")
            let _ = DukePerson.savepersonInfo(self.dukeperson)
            print(dukeperson.count)
            let tempdukeperson = DukePerson.loadpersonInfo()
            print(tempdukeperson!.count)
            }
    }
    
    func initialtabledata(){
        teamdict.removeAll()
        teams.removeAll()
        teamdict["Professor"] = [DukePerson]()
        teamdict["Teaching Assitant"] = [DukePerson]()
        teamdict["Student"] = [DukePerson]()
        //teamdict["Other"] = [DukePerson]()
        
        for person in self.dukeperson {
            print(person.netid)
            if person.dukerole == .Professor{
                teamdict["Professor"]?.append(person)
            }
            else if person.dukerole == .TA{
                teamdict["Teaching Assitant"]?.append(person)
            }
            else{
                if person.team == "" || person.team.lowercased() == "none"{
                    teamdict["Student"]!.append(person)
                }
                else{
                    if teamdict[person.team] == nil{
                    teamdict.updateValue([DukePerson](), forKey: person.team)
                }
                
                    //teamdict[person.team] = [DukePerson]()
                    teamdict[person.team]!.append(person)
                }
            }
        }
        print("this is xxx: " + String(self.dukeperson.count))
        teams = Array(teamdict.keys)
        
        filterteamdict = teamdict
        filterteams = teams
        filterteams.sort(by: <)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("hello")
        super.viewDidAppear(animated)
        self.loadInitialData() //loadjason
        self.initialtabledata()  //load teamdict
        //print(teams)
        self.tableView.reloadData() //更新tableview里的data
        //alert()
        //print(dukepersondownload)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadlabel.frame = CGRect(x: 150, y: 620, width: 200, height: 50)
        downloadlabel.textColor = .white
        //view.addSubview(downloadlabel)
        retrievebutton.addTarget(self, action:#selector(retrievebuttonClicked(_ :)), for: .touchUpInside)
        addbutton.target = self
        addbutton.action = #selector(action)
        filterteamdict = teamdict
        filterteams = teams
        filterteams.sort(by:<)
        tableView.dataSource = self
        searchbar.delegate = self
        tableView.separatorColor = .white
              //self.dukeperson = DukePerson.loadpersonInfo()!
        // Do any additional setup after loading the view.
        //print(dukepersondownload)

        //UIAlertController
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        print("sections" + String(filterteams.count))
        return filterteams.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return filterteams[section]
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterteamdict[filterteams[section]]?.count ?? 0
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 140.0;//Choose your custom row height
//        }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        let dictlist = filterteamdict[filterteams[indexPath.section]]
        var name = (dictlist?[indexPath.row].firstName ?? "unknown")
            + " " + (dictlist?[indexPath.row].lastName ?? "unknown")
        name = name + " " + (dictlist?[indexPath.row].netid ?? "unknown")
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = dictlist?[indexPath.row].description
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(red: 0/255, green: 48/255, blue: 135/255, alpha: 1)
        cell.detailTextLabel?.textColor = .white
        cell.detailTextLabel?.numberOfLines = 0
//        let dataDecoded : Data? = Data(base64Encoded: (dictlist?[indexPath.row].imagename)!)
//            cell.imageView?.image = UIImage(data: dataDecoded!)
//            if cell.imageView?.image == nil {
//                cell.imageView?.image = UIImage(named: "default.jpg")
//            }
        let imagename = dictlist?[indexPath.row].imagename
        let image = imagename?.toImage()
        let smallImage = image?.copy(newSize: CGSize(width: 100, height: 100))
        //        let imageView = UIImageView(image: image)
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
        cell.imageView?.image = smallImage
        //cell.imageView?.contentMode =  .scaleAspectFit
        //cell.imageView?.clipsToBounds = true
        
        
        return cell

    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let delete = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, sourceView, completionHandler) in
                print("index path of delete: \(indexPath)")
                let dictlist = filterteamdict[filterteams[indexPath.section]]
                let deletenetid = (dictlist?[indexPath.row].netid)
                for index in 0 ..< dukeperson.count-1 {
                    print("test")
                    print(index)
                    print(dukeperson.count)
                    let eachperson = dukeperson[index]
                    if eachperson.netid == deletenetid{
                        dukeperson.remove(at: index)
                    }
                }
                DukePerson.savepersonInfo(dukeperson)
                self.loadInitialData() //loadjason
                self.initialtabledata()  //load teamdict
                self.tableView.reloadData()
                completionHandler(true)
            }
            
            let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
                print("index path of edit: \(indexPath)")
                let dictlist = self.filterteamdict[self.filterteams[indexPath.section]]
                let name = (dictlist?[indexPath.row].firstName ?? "unknown")
                    + (dictlist?[indexPath.row].lastName ?? "unknown")
                let detailObj=InformationViewController(nibName:name, bundle: nil)
                self.navigationController?.pushViewController(detailObj, animated: true)
                detailObj.persondisplayobject = (dictlist?[indexPath.row])!
                detailObj.flagtableview = 2
                detailObj.dukeperson = self.dukeperson
                completionHandler(true)
            }
            let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename, delete])
            swipeActionConfig.performsFirstActionWithFullSwipe = false
            return swipeActionConfig
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictlist = filterteamdict[filterteams[indexPath.section]]
        let name = (dictlist?[indexPath.row].firstName ?? "unknown")
            + (dictlist?[indexPath.row].lastName ?? "unknown")
        let detailObj=InformationViewController(nibName:name, bundle: nil)
        self.navigationController?.pushViewController(detailObj, animated: true)
        detailObj.persondisplayobject = (dictlist?[indexPath.row])!
        detailObj.flagtableview = 1
        detailObj.dukeperson = self.dukeperson
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

                    // filterdata  = searchText.isEmpty ? data : data.filter {(item : String) -> Bool in
        print(searchText)
        var tmpteamdict = [String:[DukePerson]]()
        tmpteamdict["Professor"] = [DukePerson]()
        tmpteamdict["Teaching Assitant"] = [DukePerson]()
        tmpteamdict["Student"] = [DukePerson]()
        var tmpteams = [String]()
        if (!searchText.isEmpty) {
                    
                    for i in 0 ..< teams.count {
                        let list = teamdict[teams[i]]
                        for j in 0..<list!.count {
                            if ((list?[j].netid.contains(searchText.lowercased())) == true) {
                                print(searchText)
                                print(list?[j].netid)
                                let person = list?[j]
                                if person?.dukerole == .Professor{
                                    tmpteamdict["Professor"]?.append(person!)
                                }
                                else if person?.dukerole == .TA{
                                    tmpteamdict["Teaching Assitant"]?.append(person!)
                                }
                                else{
                                    
                                    if person?.team == "" || person?.team.lowercased() == "none"{
                                        tmpteamdict["Student"]!.append(person!)
                                    }
                                    else{
                                        print("else")
                                        if tmpteamdict[person!.team] == nil{
                                            print("team = nil" )
                                            tmpteamdict.updateValue([DukePerson](), forKey: person!.team)
                                            print("已创建")
                                    }
                                    
                                        //teamdict[person.team] = [DukePerson]()
                                        tmpteamdict[person!.team]!.append(person!)
                                        print("append nil")
                                    }
                                }
                                tmpteams = Array(tmpteamdict.keys)
                                print(tmpteams)
                            }
                        }
                    }
                } else {
                tmpteamdict = teamdict
                tmpteams = teams
                }
            filterteams = tmpteams
            filterteamdict = tmpteamdict
            self.tableView.reloadData()
        }
    @objc func retrievebuttonClicked(_ : UIButton){
 //       dukeperson = [DukePerson]()
        alert()
 //       self.loadInitialData() //loadjason
   //     self.initialtabledata()  //load teamdict
 //       self.tableView.reloadData()
        //viewDidLoad()
    }
    @objc func action (sender:UIButton) {
        let detailObj=InformationViewController()
        self.navigationController?.pushViewController(detailObj, animated: true)
        detailObj.flagtableview = 0
        detailObj.dukeperson = self.dukeperson
        
    }
    
}


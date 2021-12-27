//
//  Myflipwindow.swift
//  ECE564_HW
//
//  Created by Loaner on 10/13/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MyFlipViewController:UIViewController{
    let flipbackbutton = UIButton()
    let repeatbutton = UIButton()
    var personfirstname = String()
    let labelfirstname = UIStrokeAnimatedLabel()
    let drawBall: UIView = Ball()
    let musicbutton = UIButton()
    
    var audioPlayer = AVAudioPlayer()
    let hiking = UIImageView(image: UIImage(named: "hiking.png")!)
//    let sun = UIImageView(image: UIImage(named: "sun.png")!)
    func movehikingAround() {
        print("movehiking1111111111")
        UIView.animate(withDuration: 2.0, delay: 0,
                       options: [], animations: {
                        self.hiking.frame.origin.x += 100
                        self.hiking.frame.origin.y -= 150
                        //self.drawBall.frame.origin.x += 100
                        //self.drawBall.frame.origin.y -= 150
                        //怎么让dukeball（blueball）在这个UIview里面移动 以autoreverse的形式 在0-100之间移动
        })
        UIView.animate(withDuration: 1.5, delay: 0,
                       options: [], animations: {
                        //self.hiking.frame.origin.x += 100
                        //self.hiking.frame.origin.y -= 150
                        self.drawBall.frame.origin.x += 100
                        self.drawBall.frame.origin.y -= 100
                        //怎么让dukeball（blueball）在这个UIview里面移动 以autoreverse的形式 在0-100之间移动
        })
        
    }
//    func blink() {
//        self.sun.alpha = 0.2
//        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.sun.alpha = 1.0}, completion: nil)
//         }
    func setImageAnimationView() {
        let iav = UIImageView()
        iav.frame = CGRect(x: 270, y: 50, width: 100, height: 100)
        
        let i1 = UIImage(named: "sun.png")!
        let i2 = UIImage(named: "sun2.png")!
        iav.animationImages = [i1, i2]
        iav.animationDuration = 1
        iav.startAnimating()
        view?.addSubview(iav)
        
    }
    override func loadView() {
        let view = UIView()
        //view.backgroundColor = UIColor.white
        view.backgroundColor = UIColor(patternImage: UIImage(named: "mountainroad.jpg")!)
//        view.backgroundColor
        //backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.alpha = 0.1
        flipbackbutton.frame = CGRect(x: 20, y: 70, width: 100, height: 50)
        flipbackbutton.backgroundColor = .darkGray
        flipbackbutton.layer.cornerRadius = 5
        flipbackbutton.setTitle("Flip Back", for:.normal)
        flipbackbutton.isHidden = false
        flipbackbutton.addTarget(self, action:#selector(flipbackbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(flipbackbutton)
        
        musicbutton.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        musicbutton.setImage(UIImage(named: "musicpicture.png"), for: UIControl.State.normal)
        musicbutton.addTarget(self, action: #selector(musicbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(musicbutton)
    
        repeatbutton.frame = CGRect(x: 20, y: 140, width: 100, height: 50)
        repeatbutton.backgroundColor = .darkGray
        repeatbutton.layer.cornerRadius = 5
        repeatbutton.setTitle("Repeat", for:.normal)
        repeatbutton.isHidden = false
        repeatbutton.addTarget(self, action:#selector(repeatbuttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(repeatbutton)
        
        labelfirstname.frame = CGRect(x: 60, y: 200, width: 200, height: 150)
        labelfirstname.text = personfirstname
        labelfirstname.font = labelfirstname.font?.withSize(60)
        //labelfirstname.textColor = .white
        view.addSubview(labelfirstname)
        
        drawBall.frame = CGRect(x: 100, y: 500, width: 13, height: 13)
        view.addSubview(drawBall)
        
        //hiking person
        hiking.frame = CGRect(x: 120, y: 490, width: 100, height: 100) // Make a black background for the blue ball  蓝色dukeball的黑色背景墙
//        sun.frame = CGRect(x: 270, y: 50, width: 100, height: 100)
//        view.addSubview(sun)
        //blackBg.image = UIImage(named: "hiking.png")!
        view.addSubview(hiking)

        
        
        
        
        self.view = view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignbackground()
        labelfirstname.animationDuration = 3.0
        labelfirstname.strokeWidth = .relative(scale: 1.4)
        labelfirstname.characterSpacing = .absolute(value: 20.0)
        modalTransitionStyle = .flipHorizontal
        let sound = Bundle.main.path(forResource: "birdsound", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        movehikingAround()
        setImageAnimationView()
    }
    @objc func flipbackbuttonClicked(_ : UIButton){
        
        dismiss(animated: true, completion: nil)

    }
    @objc func musicbuttonClicked(_ : UIButton){
        
        audioPlayer.play()

    }
    
    @objc func repeatbuttonClicked(_ : UIButton){
        drawBall.frame = CGRect(x: 100, y: 500, width: 13, height: 13)
        hiking.frame = CGRect(x: 120, y: 490, width: 100, height: 100)
        movehikingAround()
        //setImageAnimationView()
    }
    
}

//
//  ball.swift
//  ECE564_HW
//
//  Created by Loaner on 10/13/21.
//  Copyright © 2021 ECE564. All rights reserved.
//

import Foundation
import UIKit
extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
extension UIBezierPath {
    
    convenience init(heartIn rect: CGRect) {
        self.init()

        //Calculate Radius of Arcs using Pythagoras
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2

        //Left Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)

        //Top Centre Dip
        self.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))

        //Right Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)

        //Right Bottom Line
        self.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))

        //Left Bottom Line
        self.close()
    }
}

class Ball: UIView {

        override func draw(_ rect: CGRect) {
            self.layer.cornerRadius = bounds.size.width/2
            self.clipsToBounds = true
            let p = UIBezierPath(heartIn: self.bounds)
            //let p = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 13, height: 13))
            UIColor.red.setFill()
            p.fill()
            
            //let textLine = "Duke"
            //let myFont = UIFont(name: "Zapfino", size: 20.0)

            //let myShadow = NSShadow()
            //myShadow.shadowBlurRadius = 3
            //myShadow.shadowOffset = CGSize(width: 3, height: 3)
            //myShadow.shadowColor = UIColor.gray

//            let myAttributes = [
//                NSAttributedString.Key.shadow: myShadow,
//                NSAttributedString.Key.font: myFont,
//                NSAttributedString.Key.foregroundColor: UIColor.white
//            ]
//            let attString = NSAttributedString(string: textLine, attributes: (myAttributes) as [NSAttributedString.Key : Any])
//            attString.draw(
//            at: CGPoint(x: 15,y: 25))

        }
        
    }
//class Ball: UIImageView {
//
//    override func draw(_ rect: CGRect) {
//
//        let p = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
//        UIColor.white.setFill()
//        p.fill()
//
//
//        }
//    }

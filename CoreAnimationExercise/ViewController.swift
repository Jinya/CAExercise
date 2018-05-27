//
//  ViewController.swift
//  CoreAnimationExercise
//
//  Created by Jinya Tu on 2018/5/27.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockView: UIView!
    var secondHand: UIView!
    var minuteHand: UIView!
    var hourHand: UIView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diameter = clockView.frame.width
        let radius = diameter / 2
        
        self.clockView.layer.cornerRadius = radius
        self.clockView.layer.borderWidth = 1.0
        self.clockView.layer.borderColor = UIColor.gray.cgColor
        
        let sH = radius + 10 - 30 - 15
        let mH = sH - 15
        let hH = mH - 15
        
        let hRatio = 10.0/hH
        let mRatio = 10.0/mH
        let sRatio = 10.0/sH
        
        let hY = radius + 10 - hH + hH*(0.5-hRatio)
        let mY = radius + 10 - mH + mH*(0.5-mRatio)
        let sY = radius + 10 - sH + sH*(0.5-sRatio)
        
        
        hourHand = UIView(frame: CGRect(x: (diameter - 7)/2,
                                        y: hY,
                                        width: 7,
                                        height: hH))
        minuteHand = UIView(frame: CGRect(x: (diameter - 5)/2,
                                          y: mY,
                                          width: 5,
                                          height: mH))
        secondHand = UIView(frame: CGRect(x: (diameter - 3)/2,
                                          y: sY,
                                          width: 3,
                                          height: sH))
        hourHand.backgroundColor = UIColor(red: 43/255.0, green: 43/255.0, blue: 43/255.0, alpha: 1.0)
        minuteHand.backgroundColor = UIColor(red: 74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1.0)
        secondHand.backgroundColor = UIColor(red: 252/255.0, green: 61/255.0, blue: 57/255.0, alpha: 1.0)
        self.clockView.addSubview(hourHand)
        self.clockView.addSubview(minuteHand)
        self.clockView.addSubview(secondHand)
        
        self.hourHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0-hRatio)
        self.minuteHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0-mRatio)
        self.secondHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0-sRatio)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.tick), userInfo: nil, repeats: true)
        
        self.tick()
        
    }
    
    @objc func tick() {
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents(
            [Calendar.Component.hour,
             Calendar.Component.minute,
             Calendar.Component.second],
            from: Date())
        let hoursAngle = Double(dateComponents.hour!)/12.0 * Double.pi * 2.0
        let minsAngle = Double(dateComponents.minute!)/60.0 * Double.pi * 2.0
        let secsAngle = Double(dateComponents.second!)/60.0 * Double.pi * 2.0
//        print("时间\(hoursAngle)h\(minsAngle)m\(secsAngle)h")
        
        self.hourHand.transform = CGAffineTransform(rotationAngle: CGFloat(hoursAngle))
        self.minuteHand.transform = CGAffineTransform(rotationAngle: CGFloat(minsAngle))
        self.secondHand.transform = CGAffineTransform(rotationAngle: CGFloat(secsAngle))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


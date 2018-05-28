//
//  ClockViewController.swift
//  CoreAnimationExercise
//
//  Created by Jinya Tu on 2018/5/27.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

    @IBOutlet weak var clockView: UIView!
    var secondHand: UIView!
    var minuteHand: UIView!
    var hourHand: UIView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diameter = clockView.frame.width
        let radius = diameter / 2
        
        clockView.layer.cornerRadius = radius
        clockView.layer.borderWidth = 1.0
        clockView.layer.borderColor = UIColor.gray.cgColor
        
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
        clockView.addSubview(hourHand)
        clockView.addSubview(minuteHand)
        clockView.addSubview(secondHand)
        
        hourHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0-hRatio)
        minuteHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0-mRatio)
        secondHand.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0-sRatio)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ClockViewController.tick), userInfo: nil, repeats: true)
        
        self.tick()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
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
//        print("Time is \(hoursAngle)h\(minsAngle)m\(secsAngle)s")
        
        hourHand.transform = CGAffineTransform(rotationAngle: CGFloat(hoursAngle))
        minuteHand.transform = CGAffineTransform(rotationAngle: CGFloat(minsAngle))
        secondHand.transform = CGAffineTransform(rotationAngle: CGFloat(secsAngle))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


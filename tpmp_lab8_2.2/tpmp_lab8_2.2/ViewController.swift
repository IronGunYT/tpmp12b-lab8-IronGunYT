//
//  ViewController.swift
//  tpmp_lab8_2.2
//
//  Created by Demid on 12.05.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // параллелограмм
        let parallelogramPath = UIBezierPath()
        parallelogramPath.move(to: CGPoint(x:    200-50, y: 100))
        parallelogramPath.addLine(to: CGPoint(x: 100-50, y: 200))
        parallelogramPath.addLine(to: CGPoint(x: 300-50, y: 200))
        parallelogramPath.addLine(to: CGPoint(x: 400-50, y: 100))
        parallelogramPath.close()

        // создание слоя для параллелограмма
        let parallelogram = CAShapeLayer()
        parallelogram.path = parallelogramPath.cgPath
        parallelogram.fillColor = UIColor.blue.cgColor
        
        let shadowP = CAShapeLayer()
        shadowP.path = parallelogram.path
        shadowP.shadowColor = UIColor.black.cgColor
        shadowP.shadowOpacity = 0.8
        shadowP.shadowOffset = CGSize(width: 3, height: 4)
        shadowP.shadowRadius = 4
        
        let gradientP = CAGradientLayer()
        gradientP.frame = view.bounds
        gradientP.colors = [UIColor.systemPink.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]
        gradientP.mask = parallelogram
        
        self.view.layer.addSublayer(shadowP)
        self.view.layer.addSublayer(gradientP)
        
        // создание октаграммы
        let octagramPath = UIBezierPath()
        let centerX: CGFloat = 200
        let centerY: CGFloat = 600
        let radius: CGFloat = 100
        let sides = 8
        let angle = CGFloat.pi * 2 / CGFloat(sides)

        octagramPath.move(to: CGPoint(x: centerX + radius * cos(0), y: centerY + radius * sin(0)))
        print(centerX + radius * cos(0), centerY + radius * sin(0))

        for side in 1...sides {
            let midX = centerX + (radius / 2) * cos(angle * CGFloat(side-1) + angle / 2)
            let midY = centerY + (radius / 2) * sin(angle * CGFloat(side-1) + angle / 2)
            octagramPath.addLine(to: CGPoint(x: midX, y: midY))
            print(midX, midY)

            let x = centerX + radius * cos(angle * CGFloat(side))
            let y = centerY + radius * sin(angle * CGFloat(side))
            octagramPath.addLine(to: CGPoint(x: x, y: y))
            print(x, y)
        }

        octagramPath.close()
        
        // создание слоя для октаграммы
        let octagram = CAShapeLayer()
        octagram.path = octagramPath.cgPath
        octagram.fillColor = UIColor.blue.cgColor
        
        let shadowT = shadowP
        shadowT.path = octagram.path
    
        let gradientT = CAGradientLayer()
        gradientT.frame = view.bounds
        gradientT.colors = [UIColor.blue.cgColor, UIColor.green.cgColor, UIColor.yellow.cgColor]
        gradientT.mask = octagram
        
        self.view.layer.addSublayer (shadowT)
        self.view.layer.addSublayer(gradientT)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


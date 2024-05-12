//
//  ViewController.swift
//  tpmp_lab8_1.2
//
//  Created by Demid on 12.05.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let squarePath = UIBezierPath()
        squarePath.move(to: CGPoint(x: 100, y: 100))
        squarePath.addLine(to: CGPoint(x: 200, y: 100))
        squarePath.addLine(to: CGPoint(x: 200, y: 200))
        squarePath.addLine(to: CGPoint(x: 100, y: 200))
        squarePath.close()
        
        let square = CAShapeLayer()
        square.path = squarePath.cgPath
        square.fillColor = UIColor.red.cgColor
        self.view.layer.addSublayer(square)
        
        let circle = CAShapeLayer()
        circle.path = circlePathWithCenter(center: CGPoint(x: 200,y: 400), radius: 50).cgPath
        circle.fillColor = UIColor.green.cgColor
        self.view.layer.addSublayer(circle)
    }
    
    func circlePathWithCenter(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: center, radius: radius, startAngle: -CGFloat(Double.pi), endAngle: -CGFloat(-Double.pi), clockwise: true)
        circlePath.close()
        return circlePath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


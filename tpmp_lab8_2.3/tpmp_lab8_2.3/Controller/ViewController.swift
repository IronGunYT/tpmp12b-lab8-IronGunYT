//
//  ViewController.swift
//  tpmp_lab8_2.3
//
//  Created by Demid on 12.05.24.
//

import UIKit

class ViewController: UIViewController {
    private let shapeView = ShapeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(shapeView)
        
        let parallelogramModel = ParallelogramModel(
                path: parallelogramPath(),
                fillColor: UIColor.green,
                shadowColor: UIColor.black,
                gradientColors: [UIColor.blue, UIColor.green, UIColor.yellow]
            )
        shapeView.configure(with: parallelogramModel)
                
        let octagramModel = OctagramModel(
                path: octagramPath(),
                fillColor: UIColor.orange,
                shadowColor: UIColor.black,
                gradientColors: [UIColor.red, UIColor.orange, UIColor.yellow]
            )
        shapeView.configure(with: octagramModel)
        
        animateRotation(for: shapeView.parallelogramLayer)
        animateScaling(for: shapeView.parallelogramLayer)
        animateMovement(for: shapeView.octagramLayer)
        animateTransparency(for: shapeView.octagramLayer)
    }
    
    private func animateRotation(for layer: CALayer) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = CGFloat.pi
        rotationAnimation.duration = 2
        rotationAnimation.repeatCount = .infinity
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    private func animateScaling(for layer: CALayer) {
        let scalingAnimation = CABasicAnimation(keyPath: "transform.scale")
        scalingAnimation.toValue = 1.5
        scalingAnimation.duration = 3
        scalingAnimation.autoreverses = true
        scalingAnimation.repeatCount = .infinity
        layer.add(scalingAnimation, forKey: "scalingAnimation")
    }
    
    private func animateMovement(for layer: CALayer) {
        let movementAnimation = CABasicAnimation(keyPath: "position")
        movementAnimation.toValue = NSValue(cgPoint: CGPoint(x: view.bounds.midX + 30, y: view.bounds.midY + 30))
        movementAnimation.duration = 4
        movementAnimation.autoreverses = true
        movementAnimation.repeatCount = .infinity
        layer.add(movementAnimation, forKey: "movementAnimation")
    }
    
    private func animateTransparency(for layer: CALayer) {
        let transparencyAnimation = CABasicAnimation(keyPath: "opacity")
        transparencyAnimation.toValue = 0.2
        transparencyAnimation.duration = 2
        transparencyAnimation.autoreverses = true
        transparencyAnimation.repeatCount = .infinity
        layer.add(transparencyAnimation, forKey: "transparencyAnimation")
    }
}

extension ViewController {
    private func parallelogramPath() -> UIBezierPath {
        let parallelogramPath = UIBezierPath()
        parallelogramPath.move(to: CGPoint(x:    200-50, y: 100))
        parallelogramPath.addLine(to: CGPoint(x: 100-50, y: 200))
        parallelogramPath.addLine(to: CGPoint(x: 300-50, y: 200))
        parallelogramPath.addLine(to: CGPoint(x: 400-50, y: 100))
        parallelogramPath.close()

        return parallelogramPath
    }
    
    private func octagramPath() -> UIBezierPath {
        let octagramPath = UIBezierPath()
        let centerX: CGFloat = 200
        let centerY: CGFloat = 600
        let radius: CGFloat = 100
        let sides = 8
        let angle = CGFloat.pi * 2 / CGFloat(sides)

        octagramPath.move(to: CGPoint(x: centerX + radius * cos(0), y: centerY + radius * sin(0)))

        for side in 1...sides {
            let midX = centerX + (radius / 2) * cos(angle * CGFloat(side-1) + angle / 2)
            let midY = centerY + (radius / 2) * sin(angle * CGFloat(side-1) + angle / 2)
            octagramPath.addLine(to: CGPoint(x: midX, y: midY))

            let x = centerX + radius * cos(angle * CGFloat(side))
            let y = centerY + radius * sin(angle * CGFloat(side))
            octagramPath.addLine(to: CGPoint(x: x, y: y))
        }

        octagramPath.close()
        
        return octagramPath
    }
}

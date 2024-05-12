//
//  ViewController.swift
//  tpmp_lab8_2.4
//
//  Created by Demid on 12.05.24.
//

import UIKit

class ViewController: UIViewController {
    private var parallelogramController: ParallelogramController!
    private let octagramLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parallelogramController = ParallelogramController()
        addChild(parallelogramController)
        view.addSubview(parallelogramController.view)
        parallelogramController.didMove(toParent: self)
        
        parallelogramController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parallelogramController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parallelogramController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parallelogramController.view.topAnchor.constraint(equalTo: view.topAnchor),
            parallelogramController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let octagram = OctagramModel(
            path: octagramPath(),
            fillColor: UIColor.clear,
            shadowColor: UIColor.black,
            gradientColors: [UIColor.red, UIColor.orange, UIColor.yellow]
        )
        
        configureOctagramLayer(with: octagram)
    }
    
    func circlePathWithCenter(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: center, radius: radius, startAngle: -CGFloat(Double.pi/2), endAngle: 0, clockwise: true)
        circlePath.close()
        return circlePath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController {
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
    
    private func configureOctagramLayer(with model: OctagramModel) {
        octagramLayer.path = model.path.cgPath
        octagramLayer.fillColor = UIColor.clear.cgColor
        octagramLayer.shadowColor = model.shadowColor.cgColor
        addGradient(to: octagramLayer, colors: model.gradientColors)
        
        view.layer.addSublayer(octagramLayer)
    }
    
    private func addGradient(to layer: CAShapeLayer, colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        let shapeMaskLayer = CAShapeLayer()
        shapeMaskLayer.path = layer.path
        gradientLayer.mask = shapeMaskLayer
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

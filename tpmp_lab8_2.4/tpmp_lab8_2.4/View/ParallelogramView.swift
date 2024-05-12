//
//  ParallelogramView.swift
//  tpmp_lab8_2.4
//
//  Created by Demid on 12.05.24.
//

import UIKit

class ParallelogramView: UIView {
    private let parallelogramLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupParallelogramLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupParallelogramLayer()
    }
    
    private func setupParallelogramLayer() {
        let parallelogramPath = UIBezierPath()
        parallelogramPath.move(to: CGPoint(x:    200-50, y: 100))
        parallelogramPath.addLine(to: CGPoint(x: 100-50, y: 200))
        parallelogramPath.addLine(to: CGPoint(x: 300-50, y: 200))
        parallelogramPath.addLine(to: CGPoint(x: 400-50, y: 100))
        parallelogramPath.close()
        
        let shadow = CAShapeLayer()
        shadow.path = parallelogramPath.cgPath
        shadow.shadowColor = UIColor.black.cgColor
        shadow.shadowOpacity = 0.8
        shadow.shadowOffset = CGSize(width: 3, height: 4)
        shadow.shadowRadius = 4
        
        layer.addSublayer(shadow)
        
        parallelogramLayer.path = parallelogramPath.cgPath
        parallelogramLayer.fillColor = UIColor.darkGray.cgColor
        layer.addSublayer(parallelogramLayer)
    }
    
    func updateFillColor(_ color: UIColor) {
        parallelogramLayer.fillColor = color.cgColor
    }
}


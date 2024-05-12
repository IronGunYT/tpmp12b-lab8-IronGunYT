//
//  View.swift
//  tpmp_lab8_2.3
//
//  Created by Demid on 12.05.24.
//

import UIKit

class ShapeView: UIView {
    let parallelogramLayer = CAShapeLayer()
    let octagramLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayers()
    }
    
    private func setupLayers() {
        layer.addSublayer(parallelogramLayer)
        layer.addSublayer(octagramLayer)
    }
    
    func configure(with model: ParallelogramModel) {
        parallelogramLayer.path = model.path.cgPath
        parallelogramLayer.fillColor = model.fillColor.cgColor
        addGradient(to: parallelogramLayer, colors: model.gradientColors)
    }
    
    func configure(with model: OctagramModel) {
        octagramLayer.path = model.path.cgPath
        octagramLayer.fillColor = model.fillColor.cgColor
        addGradient(to: octagramLayer, colors: model.gradientColors)
    }
    
    private func addGradient(to layer: CALayer, colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = layer.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

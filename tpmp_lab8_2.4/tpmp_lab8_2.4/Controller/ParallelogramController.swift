//
//  ParallelogramController.swift
//  tpmp_lab8_2.4
//
//  Created by Demid on 12.05.24.
//

import Foundation
import UIKit

class ParallelogramController: UIViewController {
    private var parallelogramView: ParallelogramView!
    private var parallelogramModel: ParallelogramModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parallelogramModel = ParallelogramModel(fillColor: UIColor.blue)
        parallelogramView = ParallelogramView(frame: view.bounds)
        view.addSubview(parallelogramView)
        
        // Добавление жестов
        addRotationGesture()
        addPinchGesture()
        addTapGesture()
        addLongPressGesture()
        addSwipeGesture()
    }
    
    func addRotationGesture() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationGesture(_:)))
        parallelogramView.addGestureRecognizer(rotationGesture)
    }
    
    @objc func handleRotationGesture(_ gesture: UIRotationGestureRecognizer) {
        if gesture.state == .ended {
            parallelogramModel.fillColor = UIColor(patternImage: UIImage(named: "background1.png")!)
            parallelogramView.updateFillColor(parallelogramModel.fillColor)
        }
    }
    
    func addPinchGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        parallelogramView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .ended {
            parallelogramModel.fillColor = UIColor(patternImage: UIImage(named: "background2.png")!)
            parallelogramView.updateFillColor(parallelogramModel.fillColor)
        }
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        parallelogramView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        parallelogramModel.fillColor = UIColor(patternImage: UIImage(named: "background3.png")!)
        parallelogramView.updateFillColor(parallelogramModel.fillColor)
    }
    
    func addLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        parallelogramView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            parallelogramModel.fillColor = UIColor(patternImage: UIImage(named: "background4.png")!)
            parallelogramView.updateFillColor(parallelogramModel.fillColor)
        }
    }
    func addSwipeGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGesture.direction = .right
        parallelogramView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.state == .ended {
            parallelogramModel.fillColor = UIColor(patternImage: UIImage(named: "background5.png")!)
            parallelogramView.updateFillColor(parallelogramModel.fillColor)
        }
    }
}


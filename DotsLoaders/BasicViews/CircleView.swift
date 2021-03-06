//
//  CircleView.swift
//  DotsLoaders
//
//  Created by Suneet on 12/19/17.
//  Copyright © 2017 agrawalsuneet. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView : UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawCircle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawCircle()
    }
    
    fileprivate func drawCircle() {
        //let size = min(bounds.width, bounds.height)
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    

        let circlePath = UIBezierPath (arcCenter: center, radius: CGFloat(circleRadius), startAngle: 0, endAngle: CGFloat(Float(360).degreesToRadians) , clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = circleColor.cgColor
        layer.addSublayer(shapeLayer)
    }
    
//    override func draw(_ rect: CGRect) {
//        //let circlePath = UIBezierPath(ovalIn: rect)
//
//        //let endAngle = ((3.147 * 360), 180)
//
////        let aPath = [UIBezierPath, bezierPathWithArcCenter,:CGPointMake(150, 150)
////            radius:75
////            startAngle:0
////            endAngle:DEGREES_TO_RADIANS(135)
////            clockwise:YES];
//
//        var centrePoint = CGPoint()
//        centrePoint.x = circleRadius
//        centrePoint.y = circleRadius
//
//        let circlePath = UIBezierPath (arcCenter: centrePoint, radius: CGFloat(circleRadius), startAngle: 0, endAngle: CGFloat(Float(360).degreesToRadians) , clockwise: true)
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = circlePath.cgPath
//        shapeLayer.fillColor = circleColor.cgColor
//        layer.addSublayer(shapeLayer)
//    }
    

//    override class func requiresConstraintBasedLayout() -> Bool {
//        return true
//    }
    
//    override var intrinsicContentSize: CGSize{
//        return CGSize(width:2 * circleRadius, height: 2 * circleRadius)
//    }

//    var intrinsicContentSize: CGSize { get }
    
    override public var intrinsicContentSize: CGSize {
        get {
            return CGSize(width:2 * circleRadius, height: 2 * circleRadius)
        }
    }
    
    @IBInspectable
    var circleRadius : CGFloat = 15.0{
        didSet {
            drawCircle()
        }
    }
    
    @IBInspectable
    var circleColor : UIColor = UIColor.blue
    
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

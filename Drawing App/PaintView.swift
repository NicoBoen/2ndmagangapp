//
//  PaintView.swift
//  Drawing App
//
//  Created by Nico Boentoro on 7/18/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class PaintView: UIView {

    var samplePoints = [CGPoint]()
    var drawImage: UIImage!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.location(in: self)
        samplePoints.append(loc)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.location(in: self)
        samplePoints.append(loc)
        
        setNeedsDisplay()
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        drawImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        samplePoints.removeAll(keepingCapacity: false)
    }
    
    
    func getMidPointFromA(a: CGPoint, b: CGPoint) -> CGPoint{
        return CGPoint (x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setAllowsAntialiasing(true)
        context?.setShouldAntialias(true)
        
        context?.setStrokeColor(UIColor.blue.cgColor)
        
        let path = UIBezierPath()
        path.lineWidth = 20
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        
        drawImage?.draw(in: bounds)
        
        if samplePoints.count > 0{
            path.move(to: samplePoints.first!)
            path.addLine(to: getMidPointFromA(a: samplePoints.first!, b: samplePoints[1]))
            
            for index in 1..<samplePoints.count - 1{
                let midPoint = getMidPointFromA(a: samplePoints[index], b: samplePoints[index + 1])
                path.addQuadCurve(to: midPoint, controlPoint: samplePoints[index])
            }
            
            path.addLine(to: samplePoints.last!)
            path.stroke()
            
        }
        
        
    }
 

}

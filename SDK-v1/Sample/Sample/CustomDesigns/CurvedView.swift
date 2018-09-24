//
//  CurvedView.swift
//  Sample
//
//  Created by Swift Developer on 22/02/2018.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit

class CurvedView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        //UIColor.whiteColor.setFill()
        myBezier.fill()
    }
}

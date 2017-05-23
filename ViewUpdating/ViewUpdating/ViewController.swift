//
//  ViewController.swift
//  ViewUpdating
//
//  Created by TJ Usiyan on 2017/05/11.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        let dotView = DotView()
        dotView.dotCount = 0
        view = dotView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.addDot))
        view.addGestureRecognizer(tapRecognizer)
    }

    var dotView: DotView {
        return view as! DotView
    }

    @objc func addDot() {
        dotView.dotCount += 1
        print(dotView.dotCount)
    }
}

class DotView: UIView {
    var dotCount: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }
        let fullRect = CGRect(origin: .zero, size: bounds.size)
        context.saveGState()
        defer { context.restoreGState() }
        context.setFillColor(UIColor.darkGray.cgColor)
        context.fill(fullRect)

        guard dotCount > 0 else { return }


        let divisionHeight = fullRect.size.height / CGFloat(dotCount)
        let pegRadius: CGFloat = 3
        let centerX = fullRect.size.width * 0.5

        for i in 0..<dotCount {
            let iAsFloat = CGFloat(i)
            let pegCenter = CGPoint(x: centerX, y: (divisionHeight / 2) + (divisionHeight * iAsFloat))
            let pegPath = UIBezierPath()
            pegPath.addArc(withCenter: pegCenter, radius: pegRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            context.setFillColor(UIColor.white.cgColor)
            pegPath.fill()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
}

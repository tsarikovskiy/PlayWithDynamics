//
//  ViewController.swift
//  PlayWithDynamics
//
//  Created by Serg Tsarikovskiy on 3/21/20.
//  Copyright © 2020 Serg Tsarikovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let circleView = BallView(frame: .init(x: 0, y: 200, width: 200, height: 200))
        circleView.backgroundColor = .yellow
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = 100
        view.addSubview(circleView)
        
        let circleView2 = BallView(frame: .init(x: UIScreen.main.bounds.width / 2,
                                                y: -50,
                                                width: 120, height: 120))
        circleView2.backgroundColor = .orange
        circleView2.layer.masksToBounds = true
        circleView2.layer.cornerRadius = 60
        view.addSubview(circleView2)
        
        let circleView3 = BallView(frame: .init(x: 0, y: 0, width: 92, height: 92))
        circleView3.backgroundColor = .purple
        circleView3.layer.masksToBounds = true
        circleView3.layer.cornerRadius = 46
        view.addSubview(circleView3)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [circleView, circleView2, circleView3])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [circleView, circleView2, circleView3])
        collision.collisionMode = .everything
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        
    }
}

final class BallView : UIView {

    override public var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .ellipse
    }
}


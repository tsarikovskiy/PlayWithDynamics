//
//  ViewController.swift
//  PlayWithDynamics
//
//  Created by Serg Tsarikovskiy on 3/21/20.
//  Copyright © 2020 Serg Tsarikovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Privetiki
    @IBOutlet private weak var containerView: UIView!
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!
    private var bounce: UIDynamicItemBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let circleView = BallView(frame: .init(x: 150, y: 700, width: 180, height: 180))
        circleView.backgroundColor = .yellow
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = 90
        containerView.addSubview(circleView)

        let circleView2 = BallView(frame: .init(x: UIScreen.main.bounds.width / 2,
                                                y: 350,
                                                width: 120, height: 120))
        circleView2.backgroundColor = .orange
        circleView2.layer.masksToBounds = true
        circleView2.layer.cornerRadius = 60
        containerView.addSubview(circleView2)

        let circleView3 = BallView(frame: .init(x: 0, y: 0, width: 92, height: 92))
        circleView3.backgroundColor = .purple
        circleView3.layer.masksToBounds = true
        circleView3.layer.cornerRadius = 46
        containerView.addSubview(circleView3)

        let circleView4 = BallView(frame: .init(x: 50, y: 0, width: 180, height: 180))
        circleView4.backgroundColor = .yellow
        circleView4.layer.masksToBounds = true
        circleView4.layer.cornerRadius = 90
        containerView.addSubview(circleView4)

        let circleView5 = BallView(frame: .init(x: 50,
                                               y: 550,
                                               width: 120, height: 120))
        circleView5.backgroundColor = .orange
        circleView5.layer.masksToBounds = true
        circleView5.layer.cornerRadius = 60
        containerView.addSubview(circleView5)

        let circleView6 = BallView(frame: .init(x: 250, y: 50, width: 92, height: 92))
        circleView6.backgroundColor = .purple
        circleView6.layer.masksToBounds = true
        circleView6.layer.cornerRadius = 46
        containerView.addSubview(circleView6)

        animator = UIDynamicAnimator(referenceView: containerView)
        gravity = UIGravityBehavior(items: [circleView, circleView2, circleView3, circleView4, circleView5, circleView6])

        gravity.magnitude = 0.8
        animator.addBehavior(gravity)

        collision = UICollisionBehavior(items: [circleView, circleView2, circleView3, circleView4, circleView5, circleView6])
        collision.collisionMode = .everything
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        bounce = UIDynamicItemBehavior(items: [circleView, circleView2, circleView3, circleView4, circleView5, circleView6])
//        bounce.addAngularVelocity(5, for: [circleView])
        bounce.elasticity = 0.8
//        bounce.resistance = 0.7
//        bounce.density = 0.3
//        bounce.friction = 0.1
//        bounce.charge =

        animator.addBehavior(bounce)



    }
}

final class BallView : UIView {

    override public var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .ellipse
    }
}

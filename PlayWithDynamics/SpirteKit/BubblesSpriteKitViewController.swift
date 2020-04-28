//
//  ViewController.swift
//  PlayWithDynamics
//
//  Created by Serg Tsarikovskiy on 3/21/20.
//  Copyright © 2020 Serg Tsarikovskiy. All rights reserved.
//

import UIKit
import SpriteKit

class BubblesSpriteKitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SpriteKit"

        self.view = SKView()
        let scene = BallsView(size: CGSize(width: UIScreen.main.bounds.width, height: 2048))// GameScene(size: CGSize(width: 1536, height: 2048))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
}

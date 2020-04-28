//
//  BallsView.swift
//  PlayWithDynamics
//
//  Created by Serg Tsarikovskiy on 29.03.2020.
//  Copyright © 2020 Serg Tsarikovskiy. All rights reserved.
//

import SpriteKit

class BallsView: SKScene {
    
    struct PhysicsCategory {
        static let Player: UInt32 = 1
        static let Obstacle: UInt32 = 2
        static let Edge: UInt32 = 4
    }

    let cameraNode = SKCameraNode()
    var score = 0
    var circles: [SKShapeNode] = []
    var circleLabels: [SKLabelNode] = []
    
    override func didMove(to view: SKView) {
        addCircle()

        let section = SKShapeNode(rect: .init(x: 0, y: 0, width: frame.width, height: 400))
        section.fillColor = .green
        section.strokeColor = .green
        section.position = .init(x: 0, y: 300)
        let sectionBody = SKPhysicsBody(polygonFrom: section.path!)
        sectionBody.isDynamic = false
        sectionBody.categoryBitMask = PhysicsCategory.Edge
        section.physicsBody = sectionBody
        addChild(section)
        
        let trailingSection = SKShapeNode(rect: .init(x: 0, y: 0, width: 10, height: 1000))
        trailingSection.fillColor = .yellow
        trailingSection.strokeColor = .yellow
        trailingSection.position = .init(x: frame.width, y: 600)
        let sectionBody2 = SKPhysicsBody(polygonFrom: trailingSection.path!)
        sectionBody2.isDynamic = false
        sectionBody2.categoryBitMask = PhysicsCategory.Edge
        trailingSection.physicsBody = sectionBody2
        addChild(trailingSection)

        
        let leadingSection =  SKShapeNode(rect: .init(x: 0, y: 0, width: 10, height: 1000))
        leadingSection.fillColor = .red
        leadingSection.strokeColor = .red
        leadingSection.position = .init(x: -10, y: 600)
        let sectionBody3 = SKPhysicsBody(polygonFrom: leadingSection.path!)
        sectionBody3.isDynamic = false
        sectionBody3.categoryBitMask = PhysicsCategory.Edge
        leadingSection.physicsBody = sectionBody3
        addChild(leadingSection)

        
//        let ledgeBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 10))
//        ledgeBody.isDynamic = false
//        ledgeBody.categoryBitMask = PhysicsCategory.Edge
//        ledge.physicsBody = ledgeBody
//        addChild(ledge)
//

        
        
        
        physicsWorld.gravity.dy = -12
        physicsWorld.contactDelegate = self
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: frame.width / 2, y: size.height / 2)
    }
    
    func addCircle() {
        let colors: [UIColor] = [.purple,
                                 .yellow,
                                 .orange,
                                 .green,
                                 .purple,
                                 .yellow,
                                 .orange,
                                 .green,
                                 .green,
                                 .purple,
                                 .yellow,
                                 .orange,
                                 .green,
                                 .purple,
                                 .yellow,
                                 .orange]
        
        for i in 0...15 {
            let circle = SKShapeNode(circleOfRadius: 40)
            circle.fillColor = colors[i]
            circle.strokeColor = circle.fillColor
            circle.position = CGPoint(x: 40 + CGFloat(arc4random_uniform(300)),
                                      y: (size.height + CGFloat(arc4random_uniform(300))))
            
            
            let playerBody = SKPhysicsBody(circleOfRadius: 40)
            playerBody.mass = 1.5
            playerBody.affectedByGravity = true
            playerBody.collisionBitMask = 4
            circle.physicsBody = playerBody
            circle.physicsBody?.restitution = 0.7

            
            let circleLabel = SKLabelNode()
            circleLabel.text = "LOL"
            circleLabel.horizontalAlignmentMode = .center
            circleLabel.verticalAlignmentMode = .center
            circleLabel.fontSize = 20
            circleLabel.position = CGPoint(x: 0, y: 0)
            circleLabel.fontColor = UIColor.red
            
            circle.addChild(circleLabel)
            addChild(circle)
            circles.append(circle)

            // Add them into same scene
//            addChild(circleLabel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let scaleTo: CGFloat = CGFloat(arc4random_uniform(5) + 2)
                print("*** scaleTo = \(scaleTo)")
                let scaleAction = SKAction.scale(by: scaleTo * 0.43, duration: 0.4)
                scaleAction.timingMode = SKActionTimingMode.easeInEaseOut
                circle.run(SKAction.repeat(scaleAction, count: 1))
            }
        }
                
    }
    
    override func update(_ currentTime: TimeInterval) {
//        circles.forEach {
//            $0.yScale += 0.01
//            $0.xScale += 0.01
//
//        }
        print("*** update = \(currentTime)")
        
    }
    
}

extension BallsView: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if let nodeA = contact.bodyA.node as? SKShapeNode, let nodeB = contact.bodyB.node as? SKShapeNode {
            if nodeA.fillColor != nodeB.fillColor {
                //        dieAndRestart()
            }
        }
    }
}


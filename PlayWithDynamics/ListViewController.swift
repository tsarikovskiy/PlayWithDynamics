//
//  ListViewController.swift
//  PlayWithDynamics
//
//  Created by Serg Tsarikovskiy on 28.04.2020.
//  Copyright © 2020 Serg Tsarikovskiy. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Animations"
    }
    

    @IBAction private func uiKitDynamicsTap() {
        
    }
    
    @IBAction private func spriteKitTap() {
        navigationController?.pushViewController(BubblesSpriteKitViewController(),
                                                 animated: true)
    }
}

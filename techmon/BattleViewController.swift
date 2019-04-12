//
//  BattleCollectionViewCell.swift
//  techmon
//
//  Created by 野崎絵未里 on 2019/04/13.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    var enemy: Enemy!
    var player: Player!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var attackButton: UIButton!
    
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!

    @IBOutlet var enemyHPBar: UIProgressView!
    @IBOutlet var playerHPBar: UIProgressView!
    @IBOutlet weak var enemyName: UILabel!
    @IBOutlet weak var playerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

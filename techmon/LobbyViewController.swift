//
//  LobbyCollectionViewCell.swift
//  techmon
//
//  Created by 野崎絵未里 on 2019/04/13.
//  Copyright © 2019年 野崎絵未里. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {
    var maxStamina: Float = 100
    var stamina: Float = 100
    var player = Player()
    var staminaTimer: Timer!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaBar: UIProgressView!

    @IBOutlet var levelLabel: UILabel!
    
    @IBAction func startBattle() {
        if stamina >= 30 {
            stamina = stamina - 20
            staminaBar.progress = stamina / maxStamina
            performSegue(withIdentifier: "startBattle", sender: nil)
        } else {
            let alert = UIAlertController(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startBattle" {
            let battleVC = segue.destination as! BattleViewController
            player.currentHP = player.maxHP
            battleVC.player = player
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staminaBar.transform = CGAffineTransform(scaleX: 1.0, y:4.0)
        
        nameLabel.text = player.name
        levelLabel.text = String(format: "LV. %d", player.level)
        
        stamina = maxStamina
        staminaBar.progress = stamina / maxStamina
        
        staminaTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.cureStamina), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TechDraUtil.playBGM(fileName: "lobby")
    }
    @objc func cureStamina() {
        if stamina < maxStamina {
            stamina = min(stamina + 1, maxStamina)
            staminaBar.progress = stamina / maxStamina
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        TechDraUtil.stopBGM()
    }
    
}

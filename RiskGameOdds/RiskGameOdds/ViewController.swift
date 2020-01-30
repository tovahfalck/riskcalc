//
//  ViewController.swift
//  RiskGameOdds
//
//  Created by Tovah Falck on 1/21/20.
//  Copyright © 2020 Tovah Falck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var attackerNumber: UITextField!
    @IBOutlet weak var defenderNumber: UITextField!
    
    @IBOutlet weak var resultAttackerWins: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculate(_ sender: Any) {
        let attackers = attackerNumber.text
        let defenders = defenderNumber.text
        
        let node = Node (attackers: Int(attackers!)!, defenders: Int(defenders!)!)
        
        //TODO: implement this correctly
        
        let result = node.children()[0]
        resultAttackerWins.text = "\(String(format: "%.01f", result.probability * 100))%"
    }
}


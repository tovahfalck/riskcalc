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
    @IBOutlet weak var resultDefenderWins: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculate(_ sender: Any) {
        let attackers = attackerNumber.text
        let defenders = defenderNumber.text
        
        let node = Node (attackers: Int(attackers!)!, defenders: Int(defenders!)!)
        
        //TODO: implement this correctly
        
        let result1 = node.getTotalProbabilityOfWinningAttacks()
        resultAttackerWins.text = "\(String(format: "%.01f", result1 * 100))%"
        let result2 = node.getTotalProbabilityOfLosingAttacks()
        resultDefenderWins.text = "\(String(format: "%.01f", result2 * 100))%"
    }
}


//
//  Node.swift
//  RiskGameOdds
//
//  Created by Tovah Falck on 1/21/20.
//  Copyright © 2020 Tovah Falck. All rights reserved.
//

import Foundation

class Node {
    var attackers:Int
    var defenders:Int
    
    init (attackers:Int, defenders: Int){
        self.attackers = attackers
        self.defenders = defenders
    }
    
    func children() -> [Result]{
        //TODO: put logic for finding children
        return [Result (probability: 0.293, outcome: Node(attackers: 3, defenders: 3))]
    }
}

class Result {
    var probability: Double
    var outcome: Node
    
    init (probability: Double, outcome: Node){
        self.probability = probability
        self.outcome = outcome
        
    }
}

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
        //1. determin the number of red dice
        let numberOfRedDice = calculateNumberOfRedDice(numberOfPieces: attackers)
        
        //2. determin the number of white dice
        let numberOfwhiteDice = calculateNumberOfWhiteDice(numberOfPieces: defenders)
        
        //3. chose the number of outcomes
        switch numberOfRedDice {
        case 3:
            switch numberOfwhiteDice {
            case 2:
                return [
                    Result (probability: 0.3717, outcome:
                        Node(attackers: attackers, defenders: defenders - 2)),
                    Result (probability: 0.3358, outcome:
                        Node(attackers: (attackers - 1), defenders: (defenders - 1))),
                    Result (probability: 0.2926, outcome:
                        Node(attackers: attackers - 2, defenders: defenders)),
                ]
            case 1:
                return [
                    Result (probability: 0.6597, outcome:
                        Node(attackers: attackers, defenders: defenders - 1)),
                    Result (probability: 0.3403, outcome:
                        Node(attackers: attackers - 1, defenders: defenders)),
                ]
            default:
                <#code#>
            }
        case 2:
            switch numberOfwhiteDice {
            case 2:
                <#code#>
            case 1:
                <#code#>
            default:
                <#code#>
            }
        case 1:
            switch numberOfwhiteDice {
            case 2:
                <#code#>
            case 1:
                <#code#>
            default:
                <#code#>
            }
        default:
            <#code#>
        }
        
        
        
        return [Result (probability: 0.293, outcome: Node(attackers: 3, defenders: 3))]
    }
    
    /**
     * We are assuming that the player will only choose to use the number of dice that gives them the highest odds.
     */
    func calculateNumberOfRedDice(numberOfPieces:Int) -> Int {
        if (numberOfPieces >= 4){
            return 3
        }
        if (numberOfPieces == 3){
            return 2
        }
        if (numberOfPieces == 2){
            return 1
        }
        else {
            return 0
        }
    }
    
    /**
     * We are assuming that the player will only choose to use the number of dice that gives them the highest odds.
     */
    func calculateNumberOfWhiteDice(numberOfPieces:Int) -> Int {
        if (numberOfPieces >= 2){
            return 2
        }
        if (numberOfPieces == 1){
            return 1
        }
        else {
            return 0
        }
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


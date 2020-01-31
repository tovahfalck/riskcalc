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
         
    func getTotalProbabilityOfWinningAttacks() -> Double {
        return getProbabilityOfWinning(node: self)
    }
         
    func getProbabilityOfWinning(node: Node) -> Double {
        let c = node.children()
        
        var probability = 0.0
        
        c.forEach { result in
            if (result.outcome.defenders == 0){
                //green leaf
                probability += result.probability
            }
            else if (result.outcome.attackers == 1){
                //blue leaf
                // DO NOTHING
            }
            else {
                probability += result.probability * getProbabilityOfWinning(node: result.outcome)
            }
        }
        return probability
    }
    func getTotalProbabilityOfLosingAttacks() -> Double {
        return getProbabilityOfLosing(node: self)
    }
    
    func getProbabilityOfLosing(node: Node) -> Double {
        let c = node.children()
        
        var probability = 0.0
        
        c.forEach { result in
            if (result.outcome.defenders == 0){
                //green leaf
                // DO NOTHING

            }
            else if (result.outcome.attackers == 1){
                //blue leaf
                probability += result.probability
            }
            else {
                probability += result.probability * getProbabilityOfLosing(node: result.outcome)
            }
        }
        return probability
    }
//    func getTotalProbabilityOfLosingAttacks() -> Double {
//        code
//    }
    
    
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
                //3v2
                return [
                    Result (probability: 0.3717, outcome:
                        Node(attackers: attackers, defenders: defenders - 2)),
                    Result (probability: 0.3358, outcome:
                        Node(attackers: (attackers - 1), defenders: (defenders - 1))),
                    Result (probability: 0.2926, outcome:
                        Node(attackers: attackers - 2, defenders: defenders)),
                ]
            case 1:
                //3v1
                return [
                    Result (probability: 0.6597, outcome:
                        Node(attackers: attackers, defenders: defenders - 1)),
                    Result (probability: 0.3403, outcome:
                        Node(attackers: attackers - 1, defenders: defenders)),
                ]
            default:
                return [
                ]
            }
        case 2:
            switch numberOfwhiteDice {
            case 2:
                //2v2
                return [
                    Result (probability: 0.2276, outcome:
                        Node(attackers: attackers, defenders: defenders - 1)),
                    Result (probability: 0.4483, outcome:
                        Node(attackers: attackers - 1, defenders: defenders)),
                    Result (probability: 0.3241, outcome:
                        Node(attackers: (attackers - 1), defenders: (defenders - 1))),
                ]
            case 1:
                //2v1
                return [
                    Result (probability: 0.5787, outcome:
                               Node(attackers: attackers, defenders: defenders - 1)),
                    Result (probability: 0.4213, outcome:
                               Node(attackers: attackers - 1, defenders: defenders)),
                ]
            default:
                return [
                ]
            }
        case 1:
            switch numberOfwhiteDice {
            case 2:
                //1v2
                 return [
                    Result (probability: 0.2546, outcome:
                            Node(attackers: attackers, defenders: defenders - 1)),
                    Result (probability: 0.7454, outcome:
                            Node(attackers: attackers - 1, defenders: defenders)),
                ]
            case 1:
                //1v1
                return [
                    Result (probability: 0.4167, outcome:
                           Node(attackers: attackers, defenders: defenders - 1)),
                    Result (probability: 0.5833, outcome:
                           Node(attackers: attackers - 1, defenders: defenders)),
               ]
            default:
                return [
                ]
            }
        default:
            return [
            ]
        }

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


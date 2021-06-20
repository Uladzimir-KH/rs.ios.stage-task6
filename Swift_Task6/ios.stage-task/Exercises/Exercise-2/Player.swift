//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        var haveCardToToss: Bool = false
        hand?.forEach() { c in
            if card.value == c.value {
                haveCardToToss = true
            }
        }
        return haveCardToToss
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        var haveCardToToss = false
        hand?.forEach() { handCard in
            table.keys.forEach() { card in
                if card.value == handCard.value {
                    haveCardToToss = true
                }
            }
            table.values.forEach() { card in
                if card.value == handCard.value {
                    haveCardToToss = true
                }
            }
        }
        return haveCardToToss
    }
}

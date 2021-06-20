//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var minTrumpValue: Int = 10
        var plr: Player?
        players.forEach() { p in
            p.hand?.forEach() { card in
                if card.isTrump {
                    if minTrumpValue > card.value.rawValue {
                        minTrumpValue = card.value.rawValue
                        plr = p
                    }
                }
            }
        }
        return plr
    }
}

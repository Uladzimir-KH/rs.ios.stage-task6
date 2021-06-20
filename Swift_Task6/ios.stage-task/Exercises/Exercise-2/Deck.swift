import Foundation


protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
        
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cardsList: [Card] = []
        suits.forEach() { s in
            values.forEach() { v in
                cardsList.append(Card(suit: s, value: v, isTrump: false))
            }
        }
        print(cardsList)
        return cardsList
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        trump = cards.last?.suit
        setTrumpCards(for: trump!)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        players.forEach() { p in
            p.hand = []
            p.hand?.append(contentsOf: cards.dropLast(6))
            cards.removeLast(6)
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        cards.enumerated().forEach() { index, card in
            if card.suit == suit {
                self.cards[index].isTrump = true
            }
        }
    }
}


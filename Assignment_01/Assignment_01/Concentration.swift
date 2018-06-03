//
//  Concentration.swift
//  Assignment_01
//
//  Created by Phoenix Wu on H30/05/11.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    var indexOfOneAndFaceUpCard: Int?
    
    private(set) var score: Int = 0 {
        didSet {
            score = score < 0 ? 0 : score
        }
    }
    
    init(pairsOfCards: Int) {
        Card.resetIdentifier()
        var tempCards = [Card]()
        
        for _ in 0..<pairsOfCards {
            let card = Card()
            tempCards += [card, card]
        }
        
        for _ in tempCards.indices {
            cards.append(tempCards.remove(at: (tempCards.count - 1).arc4random))
        }
    }
    
    mutating func chooseCard(at: Int) {
        if !cards[at].isMatched {
            if let indexOnlyOne = indexOfOneAndFaceUpCard, indexOnlyOne != at {
                if cards[at].identifier == cards[indexOnlyOne].identifier {
                    cards[at].isMatched = true
                    cards[indexOnlyOne].isMatched = true
                    
                    score += 2
                } else {
                    score -= 1
                }
                
                cards[at].isFaceUp = true
                indexOfOneAndFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = index == at
                }
                
                indexOfOneAndFaceUpCard = at
            }
        }
    }
    
}

extension Int {
    
    var arc4random: Int {
        if self == 0 {
            return 0
        } else if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else {
            return -Int(arc4random_uniform(UInt32(abs(Int32(self)))))
        }
    }
    
}

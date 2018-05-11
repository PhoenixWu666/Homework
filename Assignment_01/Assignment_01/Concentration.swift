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
    
    var indexOfOneAndOnlyOneCard: Int?
    
    init(pairsOfCards: Int) {
        var tempCards = [Card]()
        
        for _ in 0..<pairsOfCards {
            let card = Card()
            tempCards += [card, card]
        }
        
        for _ in tempCards.indices {
            cards.append(tempCards.remove(at: (tempCards.count - 1).arc4random))
        }
    }
    
    func updateModel(at: Int) -> Card? {
        if at < cards.count {
            return cards[at]
        } else {
            return nil
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

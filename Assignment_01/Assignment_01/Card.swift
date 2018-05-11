//
//  Card.swift
//  Assignment_01
//
//  Created by Phoenix Wu on H30/05/11.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    
    var isMatched = false
    
    private(set) var identifier: Int
    
    private static var cardIndentifier = 0
    
    init() {
        identifier = Card.getIdentifier()
    }
    
    private static func getIdentifier() -> Int {
        let identifier = cardIndentifier
        cardIndentifier += 1
        
        return identifier
    }
    
}

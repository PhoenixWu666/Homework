//
//  ViewController.swift
//  Assignment_01
//
//  Created by Phoenix Wu on H30/05/11.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    private var flipCount = 0
    
    lazy var game = Concentration(pairsOfCards: cardPairs)
    
    var flippedCards = [Int : String]()
    
    var emojis = Emojis()
    
    private var cardPairs: Int {
        var cardButtonCount = cardButtons.count
        cardButtonCount = cardButtonCount % 2 == 0 ? cardButtonCount : cardButtonCount + 1
        
        return (cardButtonCount / 2)
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.index(of: sender), let card = game.updateModel(at: cardIndex) {
            if !card.isFaceUp {
                flipCount += 1
            }
            
            for cardButton in cardButtons {
                if cardButtons.index(of: cardButton) == cardIndex {
                    cardButton.setTitle(getEmoji(identifier: card.identifier), for: .normal)
                    cardButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                } else {
                    cardButton.setTitle("", for: .normal)
                    cardButton.backgroundColor = #colorLiteral(red: 0.9994830489, green: 0.6620230675, blue: 0.1431986988, alpha: 1)
                }
            }
        }
    }
    
    private func getEmoji(identifier: Int) -> String {
        if let emoji = flippedCards[identifier] {
            return emoji
        } else {
            flippedCards[identifier] = emojis.getEmoji(at: identifier)
            
            return flippedCards[identifier]!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("card count: \(game.cards.count)")
        
        for card in game.cards {
            print("card: \(card.identifier)")
        }
    }


}


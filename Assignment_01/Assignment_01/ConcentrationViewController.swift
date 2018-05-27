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
    
    private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    lazy var game = Concentration(pairsOfCards: cardPairs)
    
    var flippedCards = [Int : String]()
    
    var emojis = Emojis()
    
    private var cardPairs: Int {
        var cardButtonCount = cardButtons.count
        cardButtonCount = cardButtonCount % 2 == 0 ? cardButtonCount : cardButtonCount + 1
        
        return (cardButtonCount / 2)
    }
    
    fileprivate func updateViewModel() {
        var matchedCount = 0
        
        for index in cardButtons.indices {
            let card = game.cards[index]
            
            if card.isMatched {
                matchedCount += 1
            }
            
            if game.cards[index].isFaceUp {
                cardButtons[index].setTitle(getEmoji(identifier: card.identifier), for: .normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cardButtons[index].setTitle("", for: .normal)
                cardButtons[index].backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9994830489, green: 0.6620230675, blue: 0.1431986988, alpha: 1)
            }
        }
        
        if matchedCount == cardButtons.count {
            let alertController = UIAlertController(title: "Congratulations!", message: "新しいゲームを続けますか", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [unowned self] action in
                self.newGame()
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func newGame() {
        self.emojis.refreshEmojiModel()
        game = Concentration(pairsOfCards: cardPairs)
        flippedCards.removeAll()
        
        DispatchQueue.main.async { [unowned self] in
            self.updateViewModel()
            self.flipCount = 0
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardIndex = cardButtons.index(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewModel()
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

}


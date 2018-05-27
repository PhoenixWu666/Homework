//
//  Emojis.swift
//  Assignment_01
//
//  Created by Phoenix Wu on H30/05/11.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

class Emojis {
    
    private var emojis: [String]!
    
    private lazy var themes = [halloweenTheme, japaneseTheme, sportTheme, animalTheme, emojiTheme, weatherTheme]
    
    private var halloweenTheme = ["👻", "💀", "☠️", "😈", "🎃", "🦇", "🍭", "🍬", "🧛🏻‍♀️", "🧟‍♂️", "🧙‍♀️", "🧟‍♀️"]
    
    private var japaneseTheme = ["🌸", "🍱", "⛩", "🗻", "🏯", "🍢", "🍵", "🍶", "🌊", "🇯🇵", "💮", "🏮"]
    
    private var sportTheme = ["🥋", "⚾️", "🏹", "🎿", "🏀", "⚽️", "⛳️", "⛸", "🥊", "🏆", "🏓", "🎾"]
    
    private var animalTheme = ["🐤", "🐰", "🐹", "🐶", "🐱", "🦁", "🐵", "🐸", "🐯", "🐮", "🐷", "🦅"]
    
    private var emojiTheme = ["😂", "😍", "😜", "🤪", "🤬", "🤯", "🤫", "🤥", "😵", "😑", "😏", "🤤"]
    
    private var weatherTheme = ["❄️", "☃️", "⛄️", "🌬", "💧", "🌈", "🌧", "☁️", "🌪", "⛈", "⚡️", "🌩"]
    
    func refreshEmojiModel() {
        emojis = themes[themes.count.arc4random]
    }
    
    func getEmoji(at: Int) -> String {
        if emojis == nil {
            refreshEmojiModel()
        }
        
        if at < emojis.count {
            return emojis[at]
        } else {
            return "??"
        }
    }
    
}

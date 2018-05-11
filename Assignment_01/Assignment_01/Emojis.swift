//
//  Emojis.swift
//  Assignment_01
//
//  Created by Phoenix Wu on H30/05/11.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

class Emojis {
    
    private var emojis = ["👻", "💀", "☠️", "😈", "🎃", "🦇", "🍭", "🍬", "🧛🏻‍♀️", "🧟‍♂️", "🧙‍♀️", "🧟‍♀️"]
    
    func getEmoji(at: Int) -> String {
        if at < emojis.count {
            return emojis[at]
        } else {
            return "??"
        }
    }
    
}

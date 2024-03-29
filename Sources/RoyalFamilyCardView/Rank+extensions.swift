//
//  Created by Robert Nash on 25/03/2024.
//

import SwiftUI
import PlayingCards
import PlayingCardViewKit

extension Rank {
    
    var illustration: Image {
        Image(systemName: symbolName)
    }
    
    var symbolName: String {
        switch self {
        case .ace:
            return "cloud.drizzle"
        case .two:
            return "moon.stars"
        case .three:
            return "cloud.snow"
        case .four:
            return "cloud.heavyrain"
        case .five:
            return "cloud.bolt"
        case .six:
            return "cloud.fog"
        case .seven:
            return "cloud.sun"
        case .eight:
            return "cloud.bolt.rain"
        case .nine:
            return "cloud.moon"
        case .ten:
            return "wind.snow"
        case .jack:
            return "tornado"
        case .queen:
            return "snowflake"
        case .king:
            return "cloud.sun.rain"
        }
    }
    
    var char: String {
        switch self {
        case .ace:
            return "A"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
}

extension Rank: ScoreMechanism {
    
    public var points: UInt {
        switch self {
        case .ace:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .jack:
            return 11
        case .queen:
            return 12
        case .king:
            return 13
        }
    }
}

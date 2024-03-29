//
//  Created by Robert Nash on 25/03/2024.
//

import SwiftUI
import PlayingCards

extension Suit {
    
    var illustration: Image {
        Image(systemName: symbolName)
    }
    
    var symbolName: String {
        switch self {
        case .spades:
            return "suit.spade.fill"
        case .hearts:
            return "suit.heart.fill"
        case .diamonds:
            return "suit.diamond.fill"
        case .clubs:
            return "suit.club.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .hearts, .diamonds:
            return .red
        case .clubs, .spades:
            return .black
        }
    }
}

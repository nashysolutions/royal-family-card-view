//
//  Created by Robert Nash on 25/03/2024.
//

import SwiftUI
import PlayingCards
import PlayingCardViewKit

extension PlayingCard: CardScoreProvider {
    
    public var score: Rank {
        rank
    }
}

extension PlayingCard {
    
    var cornerSymbol: Icon {
        return bodySymbol
    }
    
    var bodySymbol: Icon {
        return Icon(suit: suit)
    }
}

extension PlayingCard {
    
    struct Icon {
        
        let suit: Suit
        
        var image: Image {
            Image(systemName: suit.symbolName)
        }
        
        var foregroundColor: Color {
            suit.color
        }
        
        func suitOffset(for width: CGFloat) -> CGFloat {
            let scale = width * 0.0025
            let value = 5 * scale
            return -value
        }
        
        func charFontSize(for width: CGFloat) -> CGFloat {
            let scale = width * 0.0035
            return 55 * scale
        }
        
        func suitFontSize(for width: CGFloat) -> CGFloat {
            let scale = width * 0.0035
            return 40 * scale
        }
        
        func cornerPadding(for width: CGFloat) -> CGFloat {
            let scale = width * 0.005
            return 10 * scale
        }
        
        func suitFont(for width: CGFloat) -> Font {
            let size = charFontSize(for: width)
            return .system(size: size)
        }
        
        func charFont(for width: CGFloat) -> Font {
            let size = charFontSize(for: width)
            return .system(size: size)
        }
    }
}

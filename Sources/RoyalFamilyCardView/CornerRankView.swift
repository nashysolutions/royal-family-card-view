//
//  Created by Robert Nash on 03/08/2022.
//

import SwiftUI
import PlayingCards

struct CornerRankView: View {
    
    var model: ViewModel
        
    var body: some View {
        
        let symbol = model.symbol
        let cardWidth = model.cardWidth
        let char = model.char
        
        VStack(spacing: 0) {
            Text(char)
                .font(symbol.charFont(for: cardWidth))
            symbol.image
                .font(symbol.suitFont(for: cardWidth))
                .offset(y: symbol.suitOffset(for: cardWidth))
        }
        .padding(symbol.cornerPadding(for: cardWidth))
        .foregroundColor(symbol.foregroundColor)
    }
}

extension CornerRankView {
    
    struct ViewModel {
        let char: String
        let symbol: PlayingCard.Icon
        let cardWidth: CGFloat
    }
}

extension CornerRankView {
    
    struct Modification: ViewModifier {
        
        let card: PlayingCard
        let cardWidth: CGFloat
        var alignment: Alignment
        
        private var isFlipped: Bool {
            alignment == .bottomTrailing
        }
        
        func body(content: Content) -> some View {
            
            let char = card.rank.char
            let cornerSymbol = card.cornerSymbol
            
            ZStack(alignment: alignment) {
                content
                CornerRankView(model: .init(char: char, symbol: cornerSymbol, cardWidth: cardWidth))
                    .rotationEffect(.degrees(isFlipped ? 180 : 0))
            }
        }
    }
}

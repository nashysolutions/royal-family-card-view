//
//  Created by Robert Nash on 03/08/2022.
//

import SwiftUI
import PlayingCards
import PlayingCardViewKit

public struct RoyalFamilyCardView: CardView {
    
    public let model: ViewModel
    
    public init(model: ViewModel) {
        self.model = model
    }

    public var body: some View {
        drawBody()
    }
    
    public func frontView(cardWidth: CGFloat, cornerRadius: CGFloat) -> FrontView {
        FrontView(model: model, cardWidth: cardWidth, cornerRadius: cornerRadius)
    }
    
    public func backView(cardWidth: CGFloat, cornerRadius: CGFloat) -> BackView {
        BackView(model: model, cardWidth: cardWidth, cornerRadius: cornerRadius)
    }
}

public extension RoyalFamilyCardView {
    
    struct ViewModel: CardModel {
                
        public let card: PlayingCard
        public var isFaceUp: Bool
        
        let frontViewStyling = FrontViewStyling()
        let backViewStyling = BackViewStyling()
        
        public init(
            card: PlayingCard,
            isFaceUp: Bool = true
        ) {
            self.card = card
            self.isFaceUp = isFaceUp
        }
        
        var bodySymbol: PlayingCard.Icon {
            card.bodySymbol
        }
        
        func illustrationFont(for width: CGFloat) -> Font {
            let scale = width * 0.003
            return .system(size: 120 * scale)
        }
    }
}

extension RoyalFamilyCardView.ViewModel {
    
    struct FrontViewStyling {
        let fillColor = Color.white
        let borderColor = Color.black
    }
}

extension RoyalFamilyCardView.ViewModel {
    
    struct BackViewStyling {
        
        let fillColor = Color.purple
        
        func font(width: CGFloat) -> Font {
            .system(size: width * 0.5)
        }
    }
}

public extension RoyalFamilyCardView {
    
    struct FrontView: CardFaceView {
        
        let model: RoyalFamilyCardView.ViewModel
        
        public let cardWidth: CGFloat
        public let cornerRadius: CGFloat
        
        public var body: some View {
            
            let frontViewStyling = model.frontViewStyling
            let bodySymbol = model.bodySymbol
            
            let font = model.illustrationFont(for: cardWidth)
            let lineWidth = model.borderLineWidth(for: cardWidth)
            
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(frontViewStyling.fillColor)
                    .cornerRank(card: model.card, cardWidth: cardWidth, alignment: .topLeading)
                    .cornerRank(card: model.card, cardWidth: cardWidth, alignment: .bottomTrailing)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .inset(by: lineWidth / 2.0)
                            .stroke(frontViewStyling.borderColor, lineWidth: lineWidth)
                    )
                bodySymbol.image
                    .font(font)
                    .foregroundColor(bodySymbol.foregroundColor)
            }
        }
    }
}

public extension RoyalFamilyCardView {
    
    struct BackView: CardFaceView {
        
        let model: RoyalFamilyCardView.ViewModel
        
        public let cardWidth: CGFloat
        public let cornerRadius: CGFloat
        
        public var body: some View {
            let backViewStyling = model.backViewStyling
            
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backViewStyling.fillColor)
                Text("🤠")
                    .font(backViewStyling.font(width: cardWidth))
            }
        }
    }
}

private extension View {
    
    func cornerRank(card: PlayingCard, cardWidth: CGFloat, alignment: Alignment) -> some View {
        modifier(CornerRankView.Modification(card: card, cardWidth: cardWidth, alignment: alignment))
    }
}

#Preview {
    RoyalFamilyCardView(model: .init(card: .init(rank: .ace, suit: .spades)))
}

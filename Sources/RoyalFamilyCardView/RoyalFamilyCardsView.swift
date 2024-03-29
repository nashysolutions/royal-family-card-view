//
//  Created by Robert Nash on 04/03/2024.
//

import SwiftUI
import PlayingCards
import PlayingCardViewKit

public struct RoyalFamilyCardsView: ScrollingCardsMenu {
    
    public typealias CardModel = RoyalFamilyCardView.ViewModel
    public typealias Deck = [CardModel]
    
    @Binding var dataBinding: Deck
    
    public init(dataBinding: Binding<Deck>) {
        _dataBinding = dataBinding
    }
    
    public var data: Binding<Deck> {
        $dataBinding
    }

    public var cardView: (CardModel) -> RoyalFamilyCardView = { card in
        RoyalFamilyCardView(model: card)
    }
    
    public var didTap: (Binding<CardModel>) -> Void = { item in
        item.wrappedValue.isFaceUp.toggle()
    }
    
    public var body: some View {
        drawBody()
    }
}

extension RoyalFamilyCardView.ViewModel: Identifiable {
    
    public var id: UInt {
        card.score.points
    }
}

#Preview {
        
    @State var data: [RoyalFamilyCardView.ViewModel] = [
        .init(card: PlayingCard(rank: .ace, suit: .hearts)),
        .init(card: PlayingCard(rank: .two, suit: .diamonds)),
        .init(card: PlayingCard(rank: .three, suit: .clubs)),
        .init(card: PlayingCard(rank: .four, suit: .clubs)),
        .init(card: PlayingCard(rank: .five, suit: .hearts)),
        .init(card: PlayingCard(rank: .six, suit: .spades)),
        .init(card: PlayingCard(rank: .seven, suit: .hearts)),
        .init(card: PlayingCard(rank: .eight, suit: .spades)),
        .init(card: PlayingCard(rank: .nine, suit: .diamonds)),
        .init(card: PlayingCard(rank: .ten, suit: .diamonds)),
        .init(card: PlayingCard(rank: .jack, suit: .hearts)),
        .init(card: PlayingCard(rank: .queen, suit: .clubs)),
        .init(card: PlayingCard(rank: .king, suit: .clubs))
    ]
    
    return RoyalFamilyCardsView(dataBinding: $data)
}

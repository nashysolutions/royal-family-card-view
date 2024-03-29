// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "royal-family-card-view",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "RoyalFamilyCardView",
            targets: ["RoyalFamilyCardView"]),
    ],
    dependencies: [
        .package(url: "git@github.com:nashysolutions/playing-cards.git", .upToNextMinor(from: "1.0.0")),
        .package(url: "git@github.com:nashysolutions/playing-card-view-kit.git", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "RoyalFamilyCardView",
            dependencies: [
                .product(name: "PlayingCards", package: "playing-cards"),
                .product(name: "PlayingCardViewKit", package: "playing-card-view-kit")
            ]
        )
    ]
)

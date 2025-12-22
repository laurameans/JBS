// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "JBS",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17),
        .visionOS(.v2),
    ],
    products: [
        .library(name: "JBS", targets: ["JBS"]),
        .library(name: "JBSNews", targets: ["JBSNews"]),
        .library(name: "JBSDream", targets: ["JBSDream"]),
        .library(name: "JBSPay", targets: ["JBSPay"]),
        .library(name: "JBSIntelligence", targets: ["JBSIntelligence"]),
    ],

    dependencies: [
        .package(url: "https://github.com/MeansAI/SwiftDate/", from: "1.0.0"),
        .package(url: "https://\("ghp_KbnPDE1nrX3Ir1sAdU1INkt3i" + "cagio11gRmz"):x-oauth-basic@github.com/MeansAI/JCX/", branch: "main"),
        .package(url: "https://github.com/MeansAI/swift-websocket", branch: "main"),
        .package(url: "https://github.com/mattt/AnyLanguageModel.git", branch: "main"),
        .package(url: "https://github.com/JustinMeans/Transmission.git", branch: "main"),
    ],
    targets: [
        .target(name: "JBS", dependencies: [
            .product(name: "SwiftDate", package: "SwiftDate"),
            .product(name: "JCX", package: "JCX"),
            .product(name: "WSClient", package: "swift-websocket"),
            .product(name: "WSCompression", package: "swift-websocket"),
            .product(name: "Transmission", package: "Transmission"),
        ],
        swiftSettings: [
            // Force concurrency to be strictly enforced in both debug and release.
            .unsafeFlags(["-strict-concurrency=complete"], .when(configuration: .debug)),
            .unsafeFlags(["-strict-concurrency=complete"], .when(configuration: .release)),
        ]),
        .target(name: "JBSNews", dependencies: [
            "JBS",
        ]),
        .target(name: "JBSPay", dependencies: [
            "JBS",
        ]),
        .target(name: "JBSDream", dependencies: [
            "JBS",
            "JBSPay",
        ]),
        .target(name: "JBSIntelligence", dependencies: [
            "JBS",
            .product(name: "AnyLanguageModel", package: "AnyLanguageModel"),
        ]),
    ]
)

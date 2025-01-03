// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "JBS",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v8),
        .macCatalyst(.v16),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "JBS", targets: ["JBS"]),
        .library(name: "JBSNews", targets: ["JBSNews"]),
        .library(name: "JBSDream", targets: ["JBSDream"]),
        .library(name: "JBSPay", targets: ["JBSPay"]),
    ],

    dependencies: [
        .package(url: "https://github.com/MeansAI/SwiftDate/", from: "1.0.0"),
        .package(url: "https://\("ghp_KbnPDE1nrX3Ir1sAdU1INkt3i" + "cagio11gRmz"):x-oauth-basic@github.com/MeansAI/JCX/", branch: "main"),
        .package(url: "https://github.com/MeansAI/swift-websocket", branch: "main"),
    ],
    targets: [
        .target(name: "JBS", dependencies: [
            .product(name: "SwiftDate", package: "SwiftDate"),
            .product(name: "JCX", package: "JCX"),
            .product(name: "WSClient", package: "swift-websocket"),
            .product(name: "WSCompression", package: "swift-websocket"),
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
    ]
)

// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// -=-=-=-=-=-=-=-=-=-=-=-
// MEANS BRIDGE
// -=-=-=-=-=-=-=-=-=-=-=-


import PackageDescription

let package = Package(
    name: "JBS",
	platforms: [
		.macOS(.v13),
		.iOS(.v16),
		.tvOS(.v16),
		.watchOS(.v8),
		.macCatalyst(.v16),
        .visionOS(.v1)
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(name: "JBS", targets: ["JBS"]),
		.library(name: "JBSNews", targets: ["JBSNews"]),
		.library(name: "JBSDream", targets: ["JBSDream"]),
		.library(name: "JBSPay", targets: ["JBSPay"])
    ],
	
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(url: "https://github.com/JustinMeans/WebsocketActorSystem", .branch("main"))
        .package(url: "https://github.com/MeansAI/SwiftDate/", from: "1.0.0"),
        .package(url: "https://\("ghp_KbnPDE1nrX3Ir1sAdU1INkt3i" + "cagio11gRmz"):x-oauth-basic@github.com/MeansAI/JCX/", branch: "main"),
        .package(url: "https://github.com/samalone/websocket-actor-system.git", from: "1.0.0"),
    ],
    targets: [
		.target(name: "JBS", dependencies: [
            .product(name: "SwiftDate", package: "SwiftDate"),
            .product(name: "JCX", package: "JCX"),
            .product(name: "WebSocketActors", package: "websocket-actor-system"),
        ]),
        .target(name: "JBSNews", dependencies: [
            "JBS"
        ]),
		.target(name: "JBSPay", dependencies: [
			"JBS"
		]),
		.target(name: "JBSDream", dependencies: [
			"JBS",
			"JBSPay"
		]),
    ]
)

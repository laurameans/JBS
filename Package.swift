// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

// -=-=-=-=-=-=-=-=-=-=-=-
// MEANS BRIDGE
// -=-=-=-=-=-=-=-=-=-=-=-


import PackageDescription

let package = Package(
    name: "MeansBridge",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macCatalyst(.v13),
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(name: "MeansBridge", targets: ["MeansBridge"]),
		.library(name: "MeansNewsBridge", targets: ["MeansNewsBridge"]),
		.library(name: "MeansDreamBridge", targets: ["MeansDreamBridge"]),
		.library(name: "MeansPayBridge", targets: ["MeansPayBridge"])
    ],
	
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(url: "https://github.com/JustinMeans/WebsocketActorSystem", .branch("main"))
        .package(url: "https://github.com/justinmeans/SwiftDate/", .branch("master"))
    ],
    targets: [
		.target(name: "MeansBridge", dependencies: [
            .product(name: "SwiftDate", package: "SwiftDate")
//            .product(name: "WebsocketActorSystem", package: "WebsocketActorSystem")
        ]),
		.target(name: "MeansNewsBridge"),
		.target(name: "MeansPayBridge", dependencies: [
			"MeansBridge"
		]),
		.target(name: "MeansDreamBridge", dependencies: [
			"MeansBridge",
			"MeansPayBridge"
		]),
    ]
)

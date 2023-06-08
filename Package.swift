// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

// -=-=-=-=-=-=-=-=-=-=-=-
// JUSTIN BRIDGE SERVICES
// -=-=-=-=-=-=-=-=-=-=-=-


import PackageDescription

let package = Package(
    name: "JBS",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macCatalyst(.v13),
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
    ],
    targets: [
		.target(name: "JBS", dependencies: [
//            .product(name: "WebsocketActorSystem", package: "WebsocketActorSystem")
        ]),
		.target(name: "JBSNews"),
		.target(name: "JBSPay", dependencies: [
			"JBS"
		]),
		.target(name: "JBSDream", dependencies: [
			"JBS",
			"JBSPay"
		]),
    ]
)

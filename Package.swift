// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "VisionCraftSwift",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .visionOS(.v1)],
    products: [
        .library(name: "VisionCraft", targets: ["VisionCraftSwift"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.20.1")
    ],
    targets: [
        .executableTarget(name: "VisionCraft-Test", dependencies: [
            "VisionCraftSwift",
            .product(name: "AsyncHTTPClient", package: "async-http-client")
        ]),
        .target(name: "VisionCraftSwift", dependencies: [
            .product(name: "AsyncHTTPClient", package: "async-http-client")
        ])
    ]
)

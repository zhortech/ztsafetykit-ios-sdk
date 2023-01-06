// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTSafetyKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZTSafetyKit",
            targets: ["ZTSafetyKitSDK"]
        )
    ],
    dependencies: [
        .package(
            name: "ZTCoreKit", 
            url: "https://github.com/zhortech/ztcorekit-ios-sdk.git",
            from: "1.1.61"
        )
    ],
    targets: [
        .target(
            name: "ZTSafetyKitSDK",
            dependencies: [
                .product(
                    name: "ZTCoreKit",
                    package: "ZTCoreKit"
                ),
                .target(
                    name: "ZTSafetyKit"
                )
            ],
            path: "Sources/ZTSafetyKitSDK"
        ),
        .binaryTarget(
            name: "ZTSafetyKit",
            path: "Sources/ZTSafetyKit.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)

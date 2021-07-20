// swift-tools-version:5.2
//
//  ZTSafetyKit.swift
//  ZTSafetyKit
//
//  Created by Pavel Shpak on 03/18/21.
//  Copyright © 2019 Zhortech. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "ZTSafetyKit",
    platforms: [
        .macOS(.v10_14), 
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ZTSafetyKit",
            targets: ["ZTSafetyKit"]
        )
    ],
    dependencies: [
        .package(name: "ZTCoreKit", url: "https://gitlab.com/zhor-tech/sdk/ios/ztcorekit", .branch("master"))
    ],
    targets: [
        .target(
            name: "ZTSafetyKit",
            dependencies: ["ZTCoreKit"], 
            exclude: ["Scripts", "Carthage", "Pods", "*.sh", "*.yml", "*.podspec", "*.resolved", "*.lock"],
            linkerSettings: [
                .linkedFramework("CoreBluetooth", .when(platforms: [.iOS])),
                .linkedFramework("CoreTelephony", .when(platforms: [.iOS])),
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("Foundation", .when(platforms: [.iOS]))
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)

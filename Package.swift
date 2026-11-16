// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealAdjustAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealAdjustAdapter",
            targets: ["AppodealAdjustAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/adjust/ios_sdk", exact: "5.8.1"),
    ],
    targets: [
        .target(
            name: "AppodealAdjustAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "AdjustSdk", package: "ios_sdk"),
                .target(name: "AdjustPurchase"),
                .target(name: "AppodealAdjustAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealAdjustAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAdjustAdapter/5.8.1.0/d0c9948e8508/AppodealAdjustAdapter.xcframework.zip",
            checksum: "d0c9948e85082b82e7220ebf2dbaf2f989781bf223b6f0afcf7a6977a3afdcf2"
        ),
.binaryTarget(
    name: "AdjustPurchase",
    url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/AdjustPurchase/1.0.1/AdjustPurchase.zip",
    checksum: "35762d332bcf3af2d9d1bfa76008af47a97987b660b35878da7b69aedf2654a4"
),
    ]
)

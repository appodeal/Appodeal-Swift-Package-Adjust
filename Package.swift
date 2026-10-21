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
        .package(url: "https://github.com/adjust/ios_sdk", exact: "5.7.0"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAdjustAdapter/5.7.0.3/9b1d2a047a5d/AppodealAdjustAdapter.xcframework.zip",
            checksum: "9b1d2a047a5ddb543d049e1c99207599cd8d3e008f9bd6d549fd1c0f6c6e213f"
        ),
.binaryTarget(
    name: "AdjustPurchase",
    url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/AdjustPurchase/1.0.1/AdjustPurchase.zip",
    checksum: "35762d332bcf3af2d9d1bfa76008af47a97987b660b35878da7b69aedf2654a4"
),
    ]
)

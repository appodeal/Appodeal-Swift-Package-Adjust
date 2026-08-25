// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealAdjustAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealAdjustAdapter",
            targets: ["AppodealAdjustAdapterWrapper"]),
        .library(
            name: "AppodealAdjustAdapterDynamic",
            targets: ["AppodealAdjustAdapterDynamic"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/adjust/ios_sdk", exact: "5.7.0"),
        .package(url: "https://github.com/adjust/adjust_signature_sdk.git", .upToNextMajor(from: "3.0.0")),
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
        .target(
            name: "AppodealAdjustAdapterDynamic",
            dependencies: [
                .product(name: "AdjustSignature", package: "adjust_signature_sdk"),
            ],
            path: "SourcesDynamic",
            sources: ["ExportsDynamic.swift"]
        ),
        .binaryTarget(
            name: "AppodealAdjustAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAdjustAdapter/5.7.0.2/59cf73da7c80/AppodealAdjustAdapter.xcframework.zip",
            checksum: "59cf73da7c80ca8746e8bd370f34e23ffae89d38fe2a9519f6831a84149947a2"
        ),
.binaryTarget(
    name: "AdjustPurchase",
    url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/AdjustPurchase/1.0.1/AdjustPurchase.zip",
    checksum: "35762d332bcf3af2d9d1bfa76008af47a97987b660b35878da7b69aedf2654a4"
),
    ]
)

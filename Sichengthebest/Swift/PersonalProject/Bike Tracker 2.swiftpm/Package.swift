// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Bike Tracker 2",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Bike Tracker 2",
            targets: ["AppModule"],
            bundleIdentifier: "one.hdcola.sichengthebest.Bike-Tracker-2",
            teamIdentifier: "5VZXP2DXCC",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .cat),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .locationAlwaysAndWhenInUse(purposeString: "track your biking")
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
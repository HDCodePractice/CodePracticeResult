import PackageDescription
 import AppleProductTypes

 let package = Package(
     name: "World clock",
     platforms: [
         .iOS("15.2")
     ],
     products: [
         .iOSApplication(
             name: "World clock",
             targets: ["AppModule"],
             bundleIdentifier: "one.hdcola.Hendry.World-clock",
             teamIdentifier: "4K2F95K9Z2",
             displayVersion: "1.0",
             bundleVersion: "1",
             iconAssetName: "AppIcon",
             accentColorAssetName: "AccentColor",
             supportedDeviceFamilies: [
                 .pad,
                 .phone
             ],

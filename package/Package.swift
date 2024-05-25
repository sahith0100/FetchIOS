// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "RestaurantsMenu",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "RestaurantsMenu",
            targets: ["RestaurantsMenu"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nalexn/ViewInspector", from: "0.9.2"),
    ],
    targets: [
        .target(
            name: "RestaurantsMenu",
            dependencies: []),
        .testTarget(
            name: "RestaurantsMenuTests",
            dependencies: ["RestaurantsMenu", "ViewInspector"]),
        .testTarget(
            name: "RestaurantsMenuUITests",
            dependencies: ["RestaurantsMenu", "ViewInspector"]),
    ]
)


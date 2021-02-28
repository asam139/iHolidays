// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iHolidaysData",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iHolidaysData",
            targets: ["iHolidaysData"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "../iHolidaysDomain", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("5.1.1")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMinor(from: "14.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "iHolidaysData",
            dependencies: [
                "iHolidaysDomain",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxMoya", package: "Moya")
            ],
            resources: [.process("Stubs")]
        ),
        .testTarget(name: "iHolidaysDataTests", dependencies: ["iHolidaysData"])
    ]
)

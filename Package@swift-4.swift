// swift-tools-version:4.0

import PackageDescription

internal let package = Package(
    name: "Gtk",
    products: [
        .library(
            name: "Gtk",
            targets: [
                "Gtk"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/rpinz/CGtk",
            .branch(
                "master"
            )
        ),
        .package(
            url: "https://github.com/rpinz/SwiftGdk",
            .branch(
                "master"
            )
        ),
        .package(
            url: "https://github.com/rpinz/SwiftAtk",
            .branch(
                "master"
            )
        )
    ],
    targets: [
        .target(
            name: "Gtk",
            dependencies: [
                "Gdk",
                "Atk"
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "GtkTests",
            dependencies: [
                "Gtk"
            ]
        )
    ],
    swiftLanguageVersions: [
        4
    ]
)

// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Gtk",
    products: [
        .library(
            name: "Gtk",
            targets: ["Gtk"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/rpinz/SwiftGdk",
            .branch("master")),
        .package(
            url: "https://github.com/rpinz/SwiftAtk",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "Gtk",
            dependencies: ["CGtk","Gdk", "Atk"],
            path: "Sources"),
        .testTarget(
            name: "GtkTests",
            dependencies: ["Gtk"]),
        .systemLibrary(
            name: "CGtk",
            path: "Library/CGtk",
            pkgConfig: "gtk+-3.0",
            providers: [
                .brew(["libgtk-3"]),
                .apt(["libgtk-3-dev"])
            ])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

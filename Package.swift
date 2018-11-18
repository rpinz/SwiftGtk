import PackageDescription

let package = Package(
    name: "Gtk",
    dependencies: [
        .Package(url: "https://github.com/rpinz/CGtk", majorVersion: 1),
        .Package(url: "https://github.com/rpinz/SwiftGdk", majorVersion: 3),
        .Package(url: "https://github.com/rpinz/SwiftAtk", majorVersion: 2)
    ],
    swiftLanguageVersions: [3, 4]
)

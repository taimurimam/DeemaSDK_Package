// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeemaSDK_Package",
    platforms: [
        .iOS(.v16)
    ] ,
    
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DeemaSDK_Package",
            targets: ["DeemaSDK_Package"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from:"4.0.0" ),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.10.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DeemaSDK_Package",
            dependencies: ["Alamofire", "SwiftyJSON"]
        ),
        .testTarget(
            name: "DeemaSDK_PackageTests",
            dependencies: ["DeemaSDK_Package"]
        ),
        
    ]
)

/**
 x-xcode-log://7CBEBCDF-9BD9-4E16-8E89-270C4B1438B8 unknown package 'Alamofire.swift' in dependencies of target 'DeemaSDK_Package'; valid packages are: 'SwiftyJSON' (from 'https://github.com/SwiftyJSON/SwiftyJSON.git'), 'Alamofire' (from 'https://github.com/Alamofire/Alamofire.git')

 */

// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "lambda-runtime-performance-test",
  dependencies: [
    .package(url: "https://github.com/fabianfett/swift-lambda-runtime.git", .upToNextMajor(from: "0.6.0")),
  ],
  targets: [
    .target(
      name: "HelloWorldLambda",
      dependencies: [
        .product(name: "LambdaRuntime", package: "swift-lambda-runtime")
      ]
    ),
  ]
)

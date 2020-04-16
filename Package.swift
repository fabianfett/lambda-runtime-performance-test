// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "lambda-runtime-performance-test",
  dependencies: [
    .package(url: "https://github.com/fabianfett/swift-lambda-runtime", .upToNextMajor(from: "0.6.0")),
  ],
  targets: [
    .target(
      name: "HelloWorldLambda",
      dependencies: ["LambdaRuntime"]),
    .testTarget(
      name: "HelloWorldLambdaTests",
      dependencies: ["HelloWorldLambda"]),
  ]
)

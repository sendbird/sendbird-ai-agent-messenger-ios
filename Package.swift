// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "SendbirdAIAgentMessenger",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "SendbirdAIAgentMessenger", targets: ["SendbirdAIAgentMessenger"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/sendbird/sendbird-ai-agent-core-ios",
            from: "0.10.0"
        )
    ],
    targets: [
        .target(
            name: "SendbirdAIAgentMessenger",
            dependencies: [
                .product(name: "SendbirdAIAgentCore", package: "sendbird-ai-agent-core-ios")
            ]
        )
    ]
)

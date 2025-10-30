// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "SendbirdAIAgentMessenger",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "SendbirdAIAgentMessenger", targets: ["SendbirdAIAgentMessenger"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/sendbird/sendbird-ai-agent-core-ios",
            from: "1.2.0"
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

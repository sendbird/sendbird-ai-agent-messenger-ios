// swift-tools-version:5.10
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
            branch: "release/0.0.3"
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

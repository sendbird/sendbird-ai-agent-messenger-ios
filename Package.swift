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
            from: "0.0.10"
        ),
        .package(
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios",
            .exact("4.25.2-beta.1")
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

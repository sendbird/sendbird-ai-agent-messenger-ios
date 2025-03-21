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
            from: "0.0.6"
        ),
        .package(
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios",
            revision: "256c46a73e5d545e7e1ca4f98750e39d35c3cdbe"
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

//
//  MainModule.swift
//  SendbirdAIAgentMessenger
//
//  Created by Tez Park on 3/22/25.
//

import Foundation

@_spi(SendbirdInternal) import SendbirdAIAgentCore
public extension AIAgentMessenger {
    static func initialize(
        appId: String,
        params: AIAgentMessenger.InitializeParams,
        completionHandler: @escaping AIAgentMessenger.ErrorHandler
    ) {
        // INFO: The initialization of the AIAgentMessenger and its Plugin implementation is handled here.
        
        AIAgentMessenger.baseInitialize(
            appId: appId,
            params: params,
            completionHandler: completionHandler
        )
    }
}

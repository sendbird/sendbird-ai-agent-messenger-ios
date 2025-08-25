# Changelog

### v0.10.6 (Aug 25, 2025)

### Features
- **Conversation Header Customization**
  - Made `SBAConversationModule.Header.TitleView` public for custom title view implementation

### Improvements
- Improved Japanese translation quality with more natural expressions
- Date separators now respect user's system locale settings

### Bug Fixes
- Fixed theme not applying

### Performance
- Fixed infinite `setupStyles()` recursion issue
- Optimized streaming event handling to prevent duplicates
- Improved table view reload performance with debouncing

### v0.10.5 (Aug 22, 2025)

### Changed
- Exposed public properties in SBAConversationModule.Header:
  - `menuButton`, `closeButton`, and `handoffButton`

### v0.10.4 (Aug 18, 2025)

### Improvements
- Profile Image Hidden Options in Conversation
  - Added `SBAConfig.Conversation.Header.shouldShowProfile` 
    - Controls profile image visibility in conversation header
  - Added `SBAConfig.Conversation.List.shouldShowSenderProfile`
    - Controls sender profile image visibility in message list 

### v0.10.3 (Aug 18, 2025)

### Improvements
- Profile Image Hidden Options in Conversation
  - Added `SBAConfig.Conversation.Header.shouldShowProfile` 
    - Controls profile image visibility in conversation header
  - Added `SBAConfig.Conversation.List.shouldShowSenderProfile`
    - Controls sender profile image visibility in message list 

### v0.10.2 (Aug 14, 2025)


### Improvements
- Supports minimum version to iOS 14 

### v0.10.2 (Aug 14, 2025)


### Improvements
- Supports minimum version to iOS 14 

### v0.10.1 (Aug 12, 2025)


### Improvements
- iOS minor version issue supports

### v0.9.15 (Aug 08, 2025)


### Improvements
- Fixed image ratio handling.
### v0.10.0 (Aug 08, 2025)

### Features
- **New Authentication Flow**: Streamlined authentication with automatic connection
  ```swift
  AIAgentMessenger.authenticate(aiAgentId: "agent123") { result in
      // Returns activeChannelURL on success
  }
  ```
  - Added `authenticate(aiAgentId:paramsBuilder:completionHandler:)` method
  - Added `AuthenticateParamsBuilder` for configuration
  - Added `AuthenticateResultHandler` returning `activeChannelURL` on success

- **Conversation Creation**: New API for creating conversations programmatically
  ```swift
  AIAgentMessenger.createConversation(aiAgentId: "agent123") { result in
      // Returns channelURL of created conversation
  }
  ```
  - Added `createConversation(aiAgentId:paramsBuilder:completionHandler:)` method
  - Added `ConversationCreateParamsBuilder`
  - Added `ChannelURLResponseHandler` for conversation creation results

- **Enhanced Builder Pattern Support**: All major APIs now support builder pattern
  - `baseInitialize(appId:paramsBuilder:completionHandler:)` with `InitializeParamsBuilder`
  - `attachLauncher(aiAgentId:channelURL:paramsBuilder:)` with `LauncherSettingsParamsBuilder`
  - `presentConversation(aiAgentId:channelURL:paramsBuilder:)` with `ConversationSettingsParamsBuilder`
  - `presentConversationList(aiAgentId:paramsBuilder:)` with `ConversationSettingsParamsBuilder`

- **Session Factory Methods**: Simplified session creation
  ```swift
  // For authenticated users
  let session = AIAgentMessenger.SessionInfo.manual(
      userId: "user123",
      sessionToken: "token",
      sessionDelegate: delegate
  )
  
  // For anonymous users
  let session = AIAgentMessenger.SessionInfo.anonymous()
  ```

- **Enhanced Template Support**: Extended message template configuration
  - Added `Cascade` template configuration in `SBAConfig.Conversation.Template.InternalVariables`
  - New cascade spacing and padding properties: `spacing`, `paddingRight`, `paddingLeft`

### Improvements
- **Color Scheme Updates**: New method for updating color scheme
  - `update(colorScheme:)` method for dynamic color scheme changes

- **Session Delegate Enhancements**: Improved session token management
  - `SessionDelegate` protocol now properly handles token updates
  - Automatic session token refresh through delegate callbacks
  - Optional methods in `SessionDelegate` with default implementations

- **Error Handling**: New error types for better error classification
  - `SBAErrorType.authenticateFailed` for authentication failures
  - `SBAErrorType.invalidAuthentication` for invalid authentication state
  - `SBAErrorType.invalidAgentInfo` for invalid agent information

- **Push Notification**: All completion handlers now execute on service queue
  - `registerPushToken(deviceToken:unique:completionHandler:)`
  - `unregisterPushToken(completionHandler:)`
  - `unregisterAllPushToken(completionHandler:)`

### Bug Fixes
- **Localization**: Fixed duplicate locale updates
  - `SBALocalization.updateLocale(_:)` now checks for duplicate updates before applying

### Performance & Stability
- **UI Performance**: Fixed infinite recursion issues
- **Memory Management**: Better resource cleanup
- **Template Configuration**: Extended template system
- **Type Safety**: Improved type definitions

### BREAKING CHANGES
- **Session Management**: Complete overhaul of session management system
  - `UserSessionInfo` class has been replaced with new `SessionInfo` hierarchy
  - `ManualSessionInfo` for authenticated users with custom user data
  - `AnonymousSessionInfo` for anonymous users (requires app attribute settings enabled)
  - `updateSessionInfo(with:)` now accepts `SessionInfo` instead of `UserSessionInfo`
  - Session info must be reset after calling `deauthenticate()` or when authentication expires

- **Initialization Parameters**: `InitializeParams` constructor removed
  - Properties are now mutable: `logLevel`, `startHandler`, `migrationHandler`, `apiHost`, `wsHost`
  - Use builder pattern instead of constructor parameters

---

**Migration Guide for v0.10.0:**

1. **Update Session Management**:
   ```swift
   // OLD (v0.9.x)
   let sessionInfo = AIAgentMessenger.UserSessionInfo(
       userId: "user123",
       sessionToken: "token",
       sessionDelegate: delegate
   )
   
   // NEW (v0.10.0)
   let sessionInfo = AIAgentMessenger.SessionInfo.manual(
       userId: "user123",
       sessionToken: "token", 
       sessionDelegate: delegate
   )
   ```

2. **Update Initialization**:
   ```swift
   // OLD (v0.9.x)
   let params = AIAgentMessenger.InitializeParams(
       logLevel: .info,
       apiHost: "custom.host"
   )
   
   // NEW (v0.10.0)
   AIAgentMessenger.baseInitialize(appId: "app123") { params in
       params.logLevel = .info
       params.apiHost = "custom.host"
   }
   ```

3. **Use New Authentication API**:
   ```swift
   // NEW in v0.10.0
   AIAgentMessenger.authenticate(aiAgentId: "agent123") { result in
       switch result {
       case .success(let activeChannelURL):
           print("Authenticated with channel: \(activeChannelURL)")
       case .failure(let error):
           print("Authentication failed: \(error)")
       }
   }
   ```

4. **Update Builder Pattern Usage**:
   ```swift
   // NEW builder pattern support
   AIAgentMessenger.attachLauncher(aiAgentId: "agent123") { params in
       params.options.position = .bottomRight
       params.parent = viewController
   }
   ```

### v0.9.14 (Aug 07, 2025)

### Improvements

- Fixed an issue where the file attachment view was not appearing.

### v0.9.14 (Aug 07, 2025)

### Improvements

- Improved functionality to handle Desk CSAT
  - Added `desk` type in `SBAMessageCSATData.DataType`

### v0.9.13 (Jul 24, 2025)

### Improvements

- Improved functionality to handle Desk CSAT
  - Added `desk` type in `SBAMessageCSATData.DataType`

### v0.9.12 (Jul 18, 2025)

### Improvements

- Improved handling of anonymous users

### v0.9.11 (Jul 14, 2025)

### Features
- Updated file upload button visibility to ensure it's visible after handed off to human agents

### v0.9.10 (Jul 01, 2025)

### Fixed
- Updated minimum required version of the dependency SDK

### v0.9.9 (Jun 30, 2025)

### Fixed
- Updated swift-tools-version to 6.1

### v0.9.8 (Jun 30, 2025)

### Fixed
- Updated swift-tools-version to 6.1

### v0.9.7 (Jun 30, 2025)

### Fixed
- Improved framework binary compatibility across different Swift versions

### v0.9.6 (Jun 27, 2025)

### BREAKING CHANGES
- **Minimum Requirements**: Xcode 16.3+ (Swift 6.1+) now required

#### What Changed
- Updated to Swift 6.1 to resolve Apple's Swift compiler compatibility issues between versions 6.0 and 6.1
- Addresses module interface incompatibility introduced in Swift 6.1

#### Why This Change?
Apple's Swift 6.1 compiler cannot load modules built with Swift 6.0, even with `BUILD_LIBRARY_FOR_DISTRIBUTION` enabled. This affects users on macOS Sequoia (which requires Xcode 16+) and those using newer Xcode versions.

#### If You See This Error:
```
Failed to build module 'SendbirdAIAgentCore'; 
this SDK is not supported by the compiler
```
**Fix**: Update to Xcode 16.3+, then clean and rebuild your project.

### v0.9.5 (Jun 25, 2025)

### Improvements

- Fixed proper handling of markAsRead
- Updated to use cached active channel

### New interfaces

- Add `SBAMessageCSATData` struct and `DataType` enum
- Add `SBAMessageTemplate`, `SBAMessageTemplate.Action`, and `ActionType` enum
- Add `didTapMessageLink()` event in Conversation ListComponent
  - Enables custom handling of link actions in markdown view

### v0.9.4 (Jun 13, 2025)

### Improvements
- Applied hidden state to poweredByMessage using appAttribute

## v0.9.2 (May 29, 2025)
### Improvements
#### Customization supports
- Added `isConversationClosedViewEnabled` property to `SBAConfig` to toggle disabling conversation closed view
- Made `ConversationViewController` type in `SBAViewControllerSet`
- Changed access levels for some interfaces to support customizations
- Refactored and opened layout methods for subclassing in `SBAConversationListModule.Header`

## v0.9.2 (May 28, 2025)
### Improvements
- Supports Objective-C compatibility

## v0.9.1 (May 27, 2025)
### Improvements
- Added `@objc` annotations to avoid naming conflict
- Debug print statements inside the UIView extension for layout slot validation were commented out.

## v0.9.0 (May 26, 2025)
### Improvements
- **SBAConfig**
  - Added `isMessageReceiptStateEnabled` property to the `Conversation`
- **NSObject+SBA**
  - Made `sba_className` properties public
- **SBAQueryParamsSet**
  - Introduced global query parameter builder (`public static var queryParamsBuilder`) for conversation list
- **SBAConversationListModule**
  - Clarified `ConversationCell` type, removed `CustomDataCell`
- **ConversationListFetcher**
  - Related file removed (internal structure refactored)

### Privacy Info
- Added `privacyInfo.xcprivacy` file to comply with Apple’s new privacy requirements.
- Describes data usage in the app as required for App Store submission.

## v0.0.10 (May 20, 2025)

### FIX
- Removed trailing comma from function argument list to ensure compatibility with Xcode 16.2. This syntax is only supported in Swift 6.1+ (Xcode 16.3 and later).

## v0.0.9 (May 19, 2025)

### Public Beta release
- Starting from this version, the beta (snapshot) dependency package has been replaced with the public dependency package
- Intended for early access and feedback

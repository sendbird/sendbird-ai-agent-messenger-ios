# Changelog

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

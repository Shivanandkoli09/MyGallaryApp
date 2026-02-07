# GalleryApp

Basic gallery application using SwiftUI + MVVM.

## Features (planned)
- Google Login (FirebaseAuth)
- Gallery with online images
- Offline persistence (Core Data)
- Profile page

## Dependencies
- FirebaseAuth
- Kingfisher
- Core Data (built-in)

## Setup
1. Clone the repo
2. Run `pod install` or use Swift Package Manager
3. Add your own `GoogleService-Info.plist` from Firebase Console

## Architecture
- MVVM (Model-View-ViewModel)
- Repository Pattern for data access
- Dependency Injection for testability
- Core Data for offline persistence
- Kingfisher for image caching

## Best Practices
- Separation of concerns
- Clean architecture layers
- Secure API key management (GoogleService-Info.plist excluded)
- Incremental commits with clear messages

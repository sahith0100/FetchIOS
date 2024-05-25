# FetchIOS
# RestaurantsMenu

## Overview
RestaurantsMenu is an iOS application that provides a list of desserts and detailed information about each dessert. The app fetches data from a remote API and displays it using SwiftUI.

## Features
- List of desserts
- Detailed view for each dessert, including ingredients and instructions
- Asynchronous data fetching with Combine

## Requirements
- iOS 13.0+
- Xcode 12.0+
- Swift 5.3+

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/RestaurantsMenu.git
    ```
2. Open the project in Xcode:
    ```sh
    cd RestaurantsMenu
    open RestaurantsMenu.xcodeproj
    ```

## Usage
1. Build and run the project in Xcode.
2. The app will display a list of desserts fetched from the remote API.
3. Tap on any dessert to view its detailed information, including ingredients and instructions.

## Swift Package Manager
This project uses Swift Package Manager (SPM) for dependency management. Ensure you open the project directory correctly to avoid issues with the `Package.swift` file.

### Adding Dependencies
To add dependencies, update the `Package.swift` file with your desired dependencies under the `dependencies` section:
```swift
dependencies: [
    .package(url: "https://github.com/username/repository.git", from: "1.0.0")
]


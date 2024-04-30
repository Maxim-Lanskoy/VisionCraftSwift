<p align="center">
    <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-5.9-brown.svg" alt="Swift Version" /></a>
    <a href="https://swift.org/download/"><img src="https://img.shields.io/badge/OS-Mac%20OS%20/%20iOS%20/%20tvOS%20/%20watchOS%20/%20visionOS-orange.svg" alt="Platform" /></a>
    <a href="https://github.com/Maxim-Lanskoy/VisionCraftSwift/actions"><img src="https://github.com/Maxim-Lanskoy/VisionCraftSwift/actions/workflows/swift.yml/badge.svg" alt="Actions" /></a>
</p>

# VisionCraftSwift

<p align="center">
<img align="center" src="https://github.com/VisionCraft-org/VisionCraft/blob/main/api.gif" width="100%" alt="API Gif"/>
</p>

VisionCraftSwift is a Swift wrapper library for interacting with the [VisionCraft API](https://github.com/VisionCraft-org/VisionCraft), facilitating easy access to a wide range of AI-powered image and text generation services. Package leverages [AsyncHTTPClient](https://github.com/swift-server/async-http-client) for network requests, providing first-class support for Swift concurrency, non-blocking request methods, and more.

## Features

- Cross-platform support for macOS, iOS, tvOS, watchOS, and visionOS.
- Support for Swift Concurrency with asynchronous and non-blocking network requests.
- Comprehensive image generation capabilities using Stable Diffusion and Stable Diffusion XL models.
- Advanced image processing features like image to image, image to video, and image upscaling.
- Text generation and processing with support for multiple LLM models.
- Audio transcription using Whisper.
- Easy to use API with asynchronous support for modern Swift applications.

## Installation

To use VisionCraftSwift in your project, you need to add it as a dependency to `Xcode` project, or mention in your `Package.swift`:

```swift
// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "<Your Project Name>",
    dependencies: [
        .package(url: "https://github.com/Maxim-Lanskoy/VisionCraftSwift.git", branch: "main")
    ],
    targets: [
        .target(
            name: "<Your Target Name>",
            dependencies: ["VisionCraftSwift"])
    ]
)
```

Replace `<Your Project Name>` and `<Your Target Name>` with your actual project and target names.

## Getting Started

To use VisionCraftSwift, you need to obtain an API key from VisionCraft. Subscribe to the VisionCraft Telegram channel and request your key by sending the `/key` command to the [VisionCraft Bot](https://t.me/VisionCraft_bot).

### Example Usage

Here are a quick examples to generate every content type available:

```swift
let vision = try await VisionCraft(token: "your_api_key")

// Generate an image with Stable Diffusion
let image = try await vision.image(prompt: "Cat")

// Generate an image with Stable Diffusion XL
let imageXL = try await vision.imageXL(prompt: "Cat", width: 512, height: 512)

// Upscale an any image
let upscale = try await vision.upscale(image: image)

// Conduct a dialogue
let messages = [LLMMessage(role: "user", content: "How?")]
let dialogue = try await vision.llm(messages: messages)

// Convert audio into text
let whisper = try await vision.whisper(audio: nil)

// Create a GIF from single image
let gif = try await vision.gif(prompt: "Cat")

// Generate an image using midjourney
let midjourney = try await vision.midJourney(prompt: "Cat")

// Fetch generated midjourney result
let midjourneyResult = try await vision.midJourney(taskId: "133951")

// Generate an image using openjourney
let openjourney = try await vision.openJourney(prompt: "Cat")

// Generate image from another image
let img2img = try await vision.img2img(image: imageXL, prompt: "Cat")

// Generate video from image
let img2video = try await vision.img2video(image: imageXL)
```

For detailed usage of all available features, refer to the [VisionCraft API documentation](https://docs.visioncraft.top).

### Using with AsyncHTTPClient

To start using VisionCraftSwift with custom [AsyncHTTPClient](https://github.com/swift-server/async-http-client), use next approach:

```swift
import AsyncHTTPClient
import VisionCraftSwift

let httpClient = HTTPClient(eventLoopGroupProvider: .singleton)
defer {
    try? httpClient.syncShutdown()
}

let visionCraft = try await VisionCraft(token: "your_api_token", client: httpClient)
```

### Shutting down HTTPClient:

When using custom [AsyncHTTPClient](https://github.com/swift-server/async-http-client) it's important to properly shut down the HTTPClient instance when all requests are completed to avoid resource leaks:

```swift
try await httpClient.shutdown()
```

## Limitations

API usage is categorized into FREE and PREMIUM subscriptions, with PREMIUM users enjoying unlimited access to all models. Refer to the [limits documentation](https://docs.visioncraft.top/getting-started/subscriptions-and-limits) for more information.

## Getting Help

If you encounter any issues or have questions, please file an issue on the GitHub repository.

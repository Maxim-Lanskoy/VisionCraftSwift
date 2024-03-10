//
// Midjourney.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /midjourney - Generate Image Route

internal struct MidjourneyRequest: Codable {
    let prompt: String // (string) - a text prompt for generation
    let token: String  // (string) - your API key from VisionCraft API
}

// MARK: POST - /midjourney/result - Get Image Route

internal struct MidjourneyResultRequest: Codable {
    let taskId: String // (string) - parameter data from your image generation request
    let token: String  // (string) - your API key from VisionCraft API
    
    enum CodingKeys: String, CodingKey {
        case taskId = "task_id"
        case token
    }
}

//
// Midjourney.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /midjourney - Generate Image Route
// {
//  "prompt": "string",
//  "token": "string"
// }

internal struct MidjourneyRequest: Codable {
    let prompt: String
    let token: String
}

// MARK: POST - /midjourney/result - Get Image Route
// {
//  "task_id": "string",
//  "token": "string"
// }

internal struct MidjourneyResultRequest: Codable {
    let taskId: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case taskId = "task_id"
        case token
    }
}

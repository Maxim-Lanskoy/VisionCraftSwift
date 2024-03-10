//
// Openjourney.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /openjourney - Openjourney

internal struct OpenjourneyRequest: Codable {
    let token: String           // (string) - your API key from VisionCraft API
    let prompt: String          // (string) - a text prompt for generation
    let negativePrompt: String? // (string) (optional) - text prompt that the model should not be drawn on the picture
    let steps: Int?             // (integer) (optional: default is 50)- the number of steps (1-50)
    let cfgScale: Float?        // (float) (optional: default is 7.5) - the CFG Scale (1-20)
    let height: Int?            // (integer) (optional: default is 50)- the number of steps (1-50)
    let width: Int              // (integer) - generated image width (minimum 128, maximum 1024), default is 1024
    
    enum CodingKeys: String, CodingKey {
        case token
        case prompt
        case negativePrompt = "negative_prompt"
        case steps
        case cfgScale = "cfg_scale"
        case height
        case width
    }
}

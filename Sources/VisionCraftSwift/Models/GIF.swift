//
// GIF.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /generate-gif - Generate Gif Route

internal struct GIFRequest: Codable {
    let sampler: String         // (string) - the name of the chosen sampler
    let prompt: String          // (string) - a text prompt for generation
    let negativePrompt: String? // (string) (optional) - text prompt that the model should not be drawn on the picture.
    let token: String           // (string) - your API key
    let cfgScale: Int?          // (integer) (optional: default is 10) - the CFG Scale (0-20)
    let steps: Int?             // (integer) (optional: default is 30)- the number of steps (1-50)
    
    enum CodingKeys: String, CodingKey {
        case sampler
        case prompt
        case negativePrompt = "negative_prompt"
        case token
        case cfgScale = "cfg_scale"
        case steps
    }
}

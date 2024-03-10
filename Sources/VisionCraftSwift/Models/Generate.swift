//
// Generate.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /generate - Generate Image Route

internal struct GenerateRequest: Codable {
    let model: String           // (string) - the name of the chosen model
    let sampler: String         // (string) - the name of the chosen sampler
    let prompt: String          // (string) - a text prompt for generation
    let negativePrompt: String? // (string) (optional) - text prompt that the model should not be drawn on the picture.
    let imageCount: Int         // (integer) - the number of images to generate (up to 5 in a single request)
    let token: String           // (string) - your API key
    let cfgScale: Int?          // (integer) (optional: default is 10) - the CFG Scale (0-20)
    let steps: Int?             // (integer) (optional: default is 30)- the number of steps (1-50)
    let loras: [String:String]? // (dict) (optional) - a dictionary in which the key is the name of the
                                //                     Lora, and the meaning is its weight.
    
    enum CodingKeys: String, CodingKey {
        case model
        case sampler
        case prompt
        case negativePrompt = "negative_prompt"
        case imageCount = "image_count"
        case token
        case cfgScale = "cfg_scale"
        case steps
        case loras
    }
}

// MARK: POST - /generate-xl - Generate Image Xl Route

internal struct GenerateXLRequest: Codable {
    let prompt: String          // (string) - a text prompt for generation
    let model: String           // (string) - one of the available SDXL models
    let token: String           // (string) - your API key
    let negativePrompt: String? // (string) (optional) - text prompt that the model should not be drawn on the picture
    let height: Int             // (integer) - generated image height (minimum 512, maximum 1024), default is 1024
    let width: Int              // (integer) - generated image width (minimum 512, maximum 1024), default is 1024
    let sampler: String         // (string) - one of the available SDXL samplers
    let scheduler: String       // (string) - one of the available SDXL schedulers
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case model
        case negativePrompt = "negative_prompt"
        case token
        case height
        case width
        case sampler
        case scheduler
    }
}

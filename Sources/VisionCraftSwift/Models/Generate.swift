//
// Generate.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /generate - Generate Image Route
// {
//  "model": "string",
//  "sampler": "string",
//  "prompt": "string",
//  "negative_prompt": "Ugly, Disfigured, Deformed, Low quality, Pixelated, Blurry, Grains, Text, Watermark, Signature, Out of frame, Disproportioned, Bad proportions, Gross proportions, Bad anatomy, Duplicate, Cropped, Extra hands, Extra arms, Extra legs, Extra fingers, Extra limbs, Long neck, Mutation, Mutilated, Mutated hands, Poorly drawn face, Poorly drawn hands, Missing hands, Missing arms, Missing legs, Missing fingers, Low resolution, Morbid.",
//  "image_count": 1,
//  "token": "string",
//  "cfg_scale": 10,
//  "steps": 30,
//  "loras": {}
// }

internal struct GenerateRequest: Codable {
    let model: String
    let sampler: String
    let prompt: String
    let negativePrompt: String?
    let imageCount: Int
    let token: String
    let cfgScale: Int
    let steps: Int
    let loras: [String]?
    
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
// {
//  "prompt": "string",
//  "model": "string",
//  "negative_prompt": "Ugly, Disfigured, Deformed, Low quality, Pixelated, Blurry, Grains, Text, Watermark, Signature, Out of frame, Disproportioned, Bad proportions, Gross proportions, Bad anatomy, Duplicate, Cropped, Extra hands, Extra arms, Extra legs, Extra fingers, Extra limbs, Long neck, Mutation, Mutilated, Mutated hands, Poorly drawn face, Poorly drawn hands, Missing hands, Missing arms, Missing legs, Missing fingers, Low resolution, Morbid.",
//  "token": "string",
//  "height": 1024,
//  "width": 1024,
//  "sampler": "euler",
//  "scheduler": "normal"
// }

internal struct GenerateXLRequest: Codable {
    let prompt: String
    let model: String
    let token: String
    let negativePrompt: String
    let height: Int
    let width: Int
    let sampler: String
    let scheduler: String
    
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

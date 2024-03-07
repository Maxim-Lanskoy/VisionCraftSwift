//
// GIF.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /generate-gif - Generate Gif Route
// {
//  "sampler": "string",
//  "prompt": "string",
//  "negative_prompt": "Ugly, Disfigured, Deformed, Low quality, Pixelated, Blurry, Grains, Text, Watermark, Signature, Out of frame, Disproportioned, Bad proportions, Gross proportions, Bad anatomy, Duplicate, Cropped, Extra hands, Extra arms, Extra legs, Extra fingers, Extra limbs, Long neck, Mutation, Mutilated, Mutated hands, Poorly drawn face, Poorly drawn hands, Missing hands, Missing arms, Missing legs, Missing fingers, Low resolution, Morbid.",
//  "token": "string",
//  "cfg_scale": 10,
//  "steps": 30
// }

internal struct GIFRequest: Codable {
    let sampler: String
    let prompt: String
    let negativePrompt: String
    let token: String
    let cfgScale: Int
    let steps: Int
    
    enum CodingKeys: String, CodingKey {
        case sampler
        case prompt
        case negativePrompt = "negative_prompt"
        case token
        case cfgScale = "cfg_scale"
        case steps
    }
}

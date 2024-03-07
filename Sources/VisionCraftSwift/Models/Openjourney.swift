//
// Openjourney.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /openjourney - Openjourney
// {
//  "token": "string",
//  "prompt": "string",
//  "negative_prompt": "Ugly, Disfigured, Deformed, Low quality, Pixelated, Blurry, Grains, Text, Watermark, Signature, Out of frame, Disproportioned, Bad proportions, Gross proportions, Bad anatomy, Duplicate, Cropped, Extra hands, Extra arms, Extra legs, Extra fingers, Extra limbs, Long neck, Mutation, Mutilated, Mutated hands, Poorly drawn face, Poorly drawn hands, Missing hands, Missing arms, Missing legs, Missing fingers, Low resolution, Morbid.",
//  "steps": 50,
//  "cfg_scale": 7.5,
//  "height": 1024,
//  "width": 1024
// }

internal struct OpenjourneyRequest: Codable {
    let token: String
    let prompt: String
    let negativePrompt: String
    let steps: Int
    let cfgScale: Float
    let height: Int
    let width: Int
    
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

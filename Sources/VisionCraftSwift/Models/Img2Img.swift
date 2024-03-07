//
// Img2Img.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /img2img - Img2Img
// {
//  "image": "string",
//  "mask": "string",
//  "token": "string",
//  "prompt": "string",
//  "negative_prompt": "Ugly, Disfigured, Deformed, Low quality, Pixelated, Blurry, Grains, Text, Watermark, Signature, Out of frame, Disproportioned, Bad proportions, Gross proportions, Bad anatomy, Duplicate, Cropped, Extra hands, Extra arms, Extra legs, Extra fingers, Extra limbs, Long neck, Mutation, Mutilated, Mutated hands, Poorly drawn face, Poorly drawn hands, Missing hands, Missing arms, Missing legs, Missing fingers, Low resolution, Morbid.",
//  "scheduler": "DDIM",
//  "steps": 50,
//  "strength": 0.8,
//  "refiner": "no_refiner"
// }

internal struct Img2ImgRequest: Codable {
    let image: String
    let mask: String?
    let token: String
    let prompt: String
    let negativePrompt: String
    let scheduler: String
    let steps: Int
    let strength: Double
    let refiner: String
    
    enum CodingKeys: String, CodingKey {
        case image
        case mask
        case token
        case prompt
        case negativePrompt = "negative_prompt"
        case scheduler
        case steps
        case strength
        case refiner
    }
}

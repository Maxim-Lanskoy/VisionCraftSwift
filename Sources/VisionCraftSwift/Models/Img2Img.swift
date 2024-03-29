//
// Img2Img.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /img2img - Img2Img

internal struct Img2ImgRequest: Codable {
    let image: String           // (string) - your image in base64 format, or URL to your image.
    let mask: String?           // (string) (optional: default is None) - If you want to change only a certain part
                                // of your image, and not all at once, then you can pass the base64 code of
                                // your mask to this parameter. Read here what a mask should look like.
    let token: String           // (string) - your API key
    let prompt: String          // (string) - a text prompt for generation
    let negativePrompt: String? // (string) (optional) - text prompt that the model should not be drawn on the picture
    let scheduler: String?      // (string) (optional: default is DDIM) - one of the available img2img schedulers
    let steps: Int?             // (integer) (optional: default is 50) - the number of steps (1-50)
    let strength: Double?       //  (float) (optional: default is 0.8) - Prompt strength. 1.0 corresponds to full
                                //                                       destruction of information in image.
    let refiner: String?        // (string) (optional: default is no_refiner) - one of the available img2img refiners
    
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
    
    init(image: String, mask: String? = nil, token: String, prompt: String, negativePrompt: String? = nil, scheduler: String = "DDIM", steps: Int = 50, strength: Double = 0.8, refiner: String = "no_refiner") {
        self.image = image
        self.mask = mask
        self.token = token
        self.prompt = prompt
        self.negativePrompt = negativePrompt
        self.scheduler = scheduler
        self.steps = steps
        self.strength = strength
        self.refiner = refiner
    }
}

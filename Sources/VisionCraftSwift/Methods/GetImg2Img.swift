//
// GetImg2Img.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func img2img(image: Data, prompt: String, negative: String? = nil, sampler: String? = nil, mask: String? = nil, steps: Int = 10, strength: Double = 0.8, scheduler: String? = nil, refiner: String? = nil) async throws -> Data {
        let string = image.base64EncodedString()
        let safeRefiner = refiner ?? self.refiners.randomElement() ?? "no_refiner"
        let safeSheduler = scheduler ?? self.schedulers.randomElement() ?? ""
        let negativePrompt = negative ?? defaultNegative
        let req = Img2ImgRequest(image: string, mask: mask, token: token, prompt: prompt, negativePrompt: negativePrompt, scheduler: safeSheduler, steps: steps, strength: strength, refiner: safeRefiner)
        return try await VisionCraftService.img2img(from: req, client: self.client)
    }
}

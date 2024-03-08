//
// GetImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func image(prompt: String, negative: String? = nil, model: String? = nil, sampler: String? = nil, loras: [String]? = nil, cfg: Int = 6, steps: Int = 10, count: Int = 1) async throws -> [URL] {
        let safeModel   = model ?? self.models.randomElement() ?? ""
        let safeSampler = sampler ?? self.samplers.randomElement() ?? ""
        let negativePrompt = negative ?? defaultNegative
        let imageCount = count
        let cfgScale   = cfg
        let safeSteps  = steps
        let req = GenerateRequest(model: safeModel, sampler: safeSampler, prompt: prompt,
                                  negativePrompt: negativePrompt, imageCount: imageCount,
                                  token: token, cfgScale: cfgScale, steps: safeSteps, loras: loras)
        let result = try await VisionCraftService.generate(from: req, client: self.client)
        return result.images.compactMap({ URL(string: $0) })
    }
}

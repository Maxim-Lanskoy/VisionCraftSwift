//
// GetGIF.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

extension VisionCraft {
    
    public func gif(prompt: String, negative: String? = nil, model: String? = nil, sampler: String? = nil, cfg: Int = 6, steps: Int = 10) async throws -> GenerateResponse {
        let safeSampler = sampler ?? self.samplers.randomElement() ?? ""
        let negativePrompt = negative ?? defaultNegative
        let req = GIFRequest(sampler: safeSampler, prompt: prompt, negativePrompt: negativePrompt,
                             token: token, cfgScale: cfg, steps: steps)
        return try await VisionCraftService.gif(from: req, client: self.client)
    }
}

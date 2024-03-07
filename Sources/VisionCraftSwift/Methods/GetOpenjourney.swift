//
// GetImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func openJourney(prompt: String, negative: String? = nil, model: String? = nil, sampler: String? = nil, cfg: Float = 6, steps: Int = 10, width: Int = 1024, height: Int = 1024) async throws -> Data {
        let negativePrompt = negative ?? defaultNegative
        let req = OpenjourneyRequest(token: token, prompt: prompt,
                                     negativePrompt: negativePrompt,
                                     steps: steps, cfgScale: cfg,
                                     height: height, width: width)
        return try await VisionCraftService.openjourney(from: req)
    }
}

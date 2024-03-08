//
// GetXLImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func imageXL(prompt: String, negative: String? = nil, model: String? = nil, sampler: String? = nil, width: Int = 1024, height: Int = 1024, scheduler: String? = nil) async throws -> Data {
        let safeModel   = model ?? self.modelsXL.randomElement() ?? ""
        let safeSampler = sampler ?? self.samplersXL.randomElement() ?? ""
        let safeSchedule = scheduler ?? self.schedulersXL.randomElement() ?? ""
        let negativePrompt = negative ?? defaultNegative
        let req = GenerateXLRequest(prompt: prompt, model: safeModel, token: token,
                                    negativePrompt: negativePrompt, height: height,
                                    width: width, sampler: safeSampler, scheduler: safeSchedule)
        return try await VisionCraftService.generateXL(from: req, client: self.client)
    }
}

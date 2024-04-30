//
// GetImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

extension VisionCraft {
    
    public func llm(messages: [LLMMessage], model: String? = nil) async throws -> LLMResponse {
        let safeModel = model ?? self.modelsLLM.randomElement() ?? ""
        let req = LLMRequest(model: safeModel, messages: messages)
        return try await VisionCraftService.llm(from: req, client: self.client, bearer: self.token)
    }
}

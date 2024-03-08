//
// API-LLM.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import AsyncHTTPClient

extension VisionCraftService {
    
    static public func llm(from params: LLMRequest, client: HTTPClient) async throws -> LLMResponse {
        let result: Response<LLMResponse> = await self.post(request: params, endpoint: "llm", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

public struct LLMResponse: Codable {
    public let model: String
    public let choices: [LLMChoice]
}

public struct LLMChoice: Codable {
    public let message: LLMMessage
    public let finishReason: String
    
    public enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
    }
}

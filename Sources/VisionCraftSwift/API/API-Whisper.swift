//
// API-Whisper.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import AsyncHTTPClient

extension VisionCraftService {
    
    static public func whisper(from params: WhisperRequest, client: HTTPClient) async throws -> WhisperResponse {
        let result: Response<WhisperResponse> = await self.post(request: params, endpoint: "whisper", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

public struct WhisperResponse: Codable {
    public let requestId: String
    public let inferenceStatus: InferenceStatus
    public let text: String
    public let segments: [Segment]
    public let language: String
    public let inputLengthMs: Int
    
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case inferenceStatus = "inference_status"
        case text
        case segments
        case language
        case inputLengthMs = "input_length_ms"
    }
}

public struct InferenceStatus: Codable {
    public let status: String
    public let runtimeMs: Int
    public let cost: Double
    public let tokensGenerated: Int?
    public let tokensInput: Int?
    
    public enum CodingKeys: String, CodingKey {
        case status
        case runtimeMs = "runtime_ms"
        case cost
        case tokensGenerated = "tokens_generated"
        case tokensInput = "tokens_input"
    }
}

public struct Segment: Codable {
    public let id: Int
    public let seek: Int
    public let start: Double
    public let end: Double
    public let text: String
    public let tokens: [Int]
    public let temperature: Double
    public let avgLogprob: Double
    public let compressionRatio: Double
    public let noSpeechProb: Double
    
    public enum CodingKeys: String, CodingKey {
        case id
        case seek
        case start
        case end
        case text
        case tokens
        case temperature
        case avgLogprob = "avg_logprob"
        case compressionRatio = "compression_ratio"
        case noSpeechProb = "no_speech_prob"
    }
}

//
// LLM.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /llm - Generate Text Route

internal struct LLMRequest: Codable {
    let token: String          // (string) - your API key
    let model: String          // (string) - the name of the chosen LLM model
    let messages: [LLMMessage] // (list) - messages to the LLM
    
    enum CodingKeys: String, CodingKey {
        case token
        case model
        case messages
    }
}

public struct LLMMessage: Codable {
    let role: String
    let content: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case role
        case content
        case image
    }
    
    public init(role: String, content: String, image: String? = nil) {
        self.role = role
        self.content = content
        self.image = image
    }
}

//
// Whisper.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /whisper - Whisper
// {
//  "audio": "string",
//  "token": "string"
// }

internal struct WhisperRequest: Codable {
    let audio: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case audio
        case token
    }
}

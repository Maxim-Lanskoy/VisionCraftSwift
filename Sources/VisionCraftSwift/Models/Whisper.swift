//
// Whisper.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

// MARK: POST - /whisper - Whisper

internal struct WhisperRequest: Codable {
    let audio: String          // (string) - your audio in base64 format or URL to your audio
    let token: String          // (string) - your API key
    let language: String?      // (optional: default is auto) - language of the audio in ISO 639-1 format
    let task: WhisperTaskType? // (optional: default is transcribe) - Available values: transcribe and translate
     
    enum CodingKeys: String, CodingKey {
        case audio
        case token
        case language
        case task
    }
}

// MARK: - Whisper Task Type Enum

enum WhisperTaskType: String, Codable, CaseIterable {
    case transcribe
    case translate
}

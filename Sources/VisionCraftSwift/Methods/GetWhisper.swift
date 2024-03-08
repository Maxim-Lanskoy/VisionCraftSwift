//
// GetImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func whisper(audio: Data) async throws -> WhisperResponse {
        let string = audio.base64EncodedString()
        let req = WhisperRequest(audio: string, token: token)
        return try await VisionCraftService.whisper(from: req, client: self.client)
    }
}

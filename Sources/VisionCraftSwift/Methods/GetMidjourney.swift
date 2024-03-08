//
// GetImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func midJourney(prompt: String) async throws -> MidjourneyResponse {
        let req = MidjourneyRequest(prompt: prompt, token: token)
        return try await VisionCraftService.midjourney(from: req, client: self.client)
    }
    
    public func midJourney(taskId: String) async throws -> MidjourneyResultResponse {
        let req = MidjourneyResultRequest(taskId: taskId, token: token)
        return try await VisionCraftService.midjourney(from: req, client: self.client)
    }
}


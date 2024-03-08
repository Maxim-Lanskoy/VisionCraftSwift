//
// GetImage.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func upscale(image: Data) async throws -> Data {
        let string = image.base64EncodedString()
        let req = UpscaleRequest(image: string, token: token)
        return try await VisionCraftService.upscale(from: req, client: self.client)
    }
}

//
// GetImg2Video.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraft {
    
    public func img2video(image: Data) async throws -> Data {
        let string = image.base64EncodedString()
        let req = Img2VideoRequest(token: token, image: string)
        return try await VisionCraftService.img2video(from: req)
    }
}

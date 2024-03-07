//
// API-Upscale.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraftService {
    
    static public func upscale(from params: UpscaleRequest) async throws -> Data {
        let result: Response<Data> = await self.post(request: params, endpoint: "upscale")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

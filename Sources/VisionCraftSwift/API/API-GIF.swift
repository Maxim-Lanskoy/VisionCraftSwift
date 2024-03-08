//
// API-GIF.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import AsyncHTTPClient

extension VisionCraftService {
    
    static public func gif(from params: GIFRequest, client: HTTPClient) async throws -> GenerateResponse {
        let result: Response<GenerateResponse> = await self.post(request: params, endpoint: "generate-gif", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

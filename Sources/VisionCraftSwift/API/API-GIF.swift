//
// API-GIF.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

extension VisionCraftService {
    
    static public func gif(from params: GIFRequest) async throws -> GenerateResponse {
        let result: Response<GenerateResponse> = await self.post(request: params, endpoint: "generate-gif")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

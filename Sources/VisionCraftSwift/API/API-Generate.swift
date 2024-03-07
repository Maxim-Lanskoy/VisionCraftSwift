//
// API-Generate.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

extension VisionCraftService {
    
    static public func generate(from params: GenerateRequest) async throws -> GenerateResponse {
        let result: Response<GenerateResponse> = await self.post(request: params, endpoint: "generate")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

public struct GenerateResponse: Codable {
    public let images: [String]
}

//
// API-GenerateXL.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraftService {
    
    static public func generateXL(from params: GenerateXLRequest) async throws -> Data {
        let result: Response<Data> = await self.post(request: params, endpoint: "generate-xl")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

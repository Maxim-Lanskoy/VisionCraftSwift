//
// API-Openjourney.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraftService {
    
    static public func openjourney(from params: OpenjourneyRequest) async throws -> Data {
        let result: Response<Data> = await self.post(request: params, endpoint: "openjourney")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

//
// API-Img2Video.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraftService {
    
    static public func img2video(from params: Img2VideoRequest) async throws -> Data {
        let result: Response<Data> = await self.post(request: params, endpoint: "img2video")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

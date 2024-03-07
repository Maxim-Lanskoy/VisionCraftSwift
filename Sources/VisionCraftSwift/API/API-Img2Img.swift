//
// API-Img2Img.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation

extension VisionCraftService {
    
    static public func img2img(from params: Img2ImgRequest) async throws -> Data {
        let result: Response<Data> = await self.post(request: params, endpoint: "img2img")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

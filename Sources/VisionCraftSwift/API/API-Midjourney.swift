//
// API-Midjourney.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation
import AsyncHTTPClient

extension VisionCraftService {
    
    static public func midjourney(from params: MidjourneyRequest, client: HTTPClient) async throws -> MidjourneyResponse {
        let result: Response<MidjourneyResponse> = await self.post(request: params, endpoint: "midjourney", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func midjourney(from params: MidjourneyResultRequest, client: HTTPClient) async throws -> MidjourneyResultResponse {
        let result: Response<MidjourneyResultResponse> = await self.post(request: params, endpoint: "midjourney/result", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

public struct MidjourneyResponse: Codable {
    public let statusCode: Int
    public let message: String
    public let data: Int
}

public struct MidjourneyResultResponse: Codable {
    public let imageID: Int
    public let status: String
    public let startTime: String
    public let requestTime: String
    public let finishTime: String
    public let url: String
    
    public enum CodingKeys: String, CodingKey {
        case imageID = "ImageID"
        case status = "Status"
        case startTime = "StartTime"
        case requestTime = "RequestTime"
        case finishTime = "FinishTime"
        case url = "URL"
    }
}

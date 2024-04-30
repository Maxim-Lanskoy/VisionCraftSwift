//
// API-Fetch.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import AsyncHTTPClient

extension VisionCraftService {
    
    static public func getModels(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "sd/models", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSamplers(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "sd/samplers", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getLoras(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "sd/loras", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
}

extension VisionCraftService {
    
    static public func getModelsLLM(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "models-llm", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

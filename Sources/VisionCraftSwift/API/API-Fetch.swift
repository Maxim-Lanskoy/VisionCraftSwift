//
// API-Fetch.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import AsyncHTTPClient

extension VisionCraftService {
    
    static public func getModels(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "models", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSamplers(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "samplers", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getLoras(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "loras", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
}

extension VisionCraftService {
    
    static public func getModelsXL(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "models-xl", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSamplersXL(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "samplers-xl", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
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

extension VisionCraftService {
    
    static public func getSchedulersXL(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "schedulers-xl", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSchedulers(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "img2img/schedulers", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getRefiners(client: HTTPClient) async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "img2img/refiners", client: client)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

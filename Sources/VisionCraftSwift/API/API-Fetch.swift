//
// API-Fetch.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

extension VisionCraftService {
    
    static public func getModels() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "models")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSamplers() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "samplers")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getLoras() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "loras")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
}

extension VisionCraftService {
    
    static public func getModelsXL() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "models-xl")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSamplersXL() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "samplers-xl")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getModelsLLM() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "models-llm")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

extension VisionCraftService {
    
    static public func getSchedulersXL() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "schedulers-xl")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getSchedulers() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "img2img/schedulers")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    static public func getRefiners() async throws -> [String] {
        let result: Response<[String]> = await self.get(endpoint: "img2img/refiners")
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

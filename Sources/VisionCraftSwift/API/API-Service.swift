//
// API-Service.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import Foundation
import AsyncHTTPClient
import NIOCore
import NIOHTTP1

internal class VisionCraftService {
    
    private enum RequestMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    private static let url = URL(string: "https://visioncraft.top/")!

    private static func send<R:Codable>(req: Codable? = nil, point: String, method: HTTPMethod, client: HTTPClient, bearer: String? = nil) async -> Response<R> {
        do {
            let endpoint = url.appendingPathComponent(point)
            var request = HTTPClientRequest(url: endpoint.absoluteString)
            request.method = method
            request.headers.add(name: "Content-Type", value: "application/json")
            if let token = bearer {
                request.headers.add(name: "Authorization", value: "Bearer \(token)")
            }
            if let body = req {
                let encoded = try JSONEncoder().encode(body)
                request.body = .bytes(ByteBuffer(data: encoded))
            }
            let response = try await client.execute(request, timeout: .seconds(60))
            let data = try await response.body.collect(upTo: 1024 * 1024 * 10) // 10 MB
            guard response.status == .ok else {
                let string = "Response from API is not 200."
                return try cascadeError(data: data, fallback: string)
            }
            do {
                let codableResponse = try JSONDecoder().decode(R.self, from: data)
                return .success(response: codableResponse)
            } catch let decodingError {
                let decoding = decodingError.localizedDescription
                return try cascadeError(data: data, fallback: decoding)
            }
        } catch let error {
            return .failure(error: .system(error: error))
        }
    }
    
    public static func get<R:Codable>(endpoint: String, client: HTTPClient) async -> Response<R> {
        return await send(point: endpoint, method: .GET, client: client)
    }
    
    public static func post<P:Codable,R:Codable>(request: P?, endpoint: String, client: HTTPClient, bearer: String? = nil) async -> Response<R> {
        return await send(req: request, point: endpoint, method: .POST, client: client, bearer: bearer)
    }
    
    private static func cascadeError<R:Codable>(data: ByteBuffer, fallback: String) throws -> Response<R> {
        do {
            let validationError = try JSONDecoder().decode(ValidationError.self, from: data)
            return .failure(error: .validation(error: validationError))
        } catch {
            do {
                let simpleError = try JSONDecoder().decode(SimpleError.self, from: data)
                return .failure(error: .apiError(error: simpleError))
            } catch {
                throw VisionError.custom(message: fallback)
            }
        }
    }
}

public enum Response<T:Codable> {
    case success(response: T)
    case failure(error: VisionError)
}

public enum VisionError: Error {
    case system(error: Error)
    case validation(error: ValidationError)
    case apiError(error: SimpleError)
    case custom(message: String)
}

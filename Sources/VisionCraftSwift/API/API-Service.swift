//
// API-Service.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
#if canImport(Foundation)
import Foundation
#endif

internal class VisionCraftService {
    
    private enum RequestMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    private static let url = URL(string: "https://visioncraft.top/")!

    private static func send<R:Codable>(req: Codable? = nil, point: String, method: RequestMethod) async -> Response<R> {
        do {
            let endpoint = url.appendingPathComponent(point)
            var urlRequest = URLRequest(url: endpoint)
            urlRequest.httpMethod = method.rawValue
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            if let body = req {
                urlRequest.httpBody = try JSONEncoder().encode(body)
            }
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                let string = "HTTPURLResponse in nil."
                return try cascadeError(data: data, fallback: string)
            }
            guard httpResponse.statusCode == 200 else {
                let string = "Response from API is not 200."
                return try cascadeError(data: data, fallback: string)
            }
            if R.self == Data.self, let imageData = data as? R {
                return .success(response: imageData)
            } else {
                do {
                    let codableResponse = try JSONDecoder().decode(R.self, from: data)
                    return .success(response: codableResponse)
                } catch let decodingError {
                    let decoding = decodingError.localizedDescription
                    return try cascadeError(data: data, fallback: decoding)
                }
            }
        } catch let error {
            return .failure(error: .system(error: error))
        }
    }
    
    public static func get<R:Codable>(endpoint: String) async -> Response<R> {
        return await send(point: endpoint, method: .get)
    }
    
    public static func post<P:Codable,R:Codable>(request: P?, endpoint: String) async -> Response<R> {
        return await send(req: request, point: endpoint, method: .post)
    }
    
    private static func cascadeError<R:Codable>(data: Data, fallback: String) throws -> Response<R> {
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

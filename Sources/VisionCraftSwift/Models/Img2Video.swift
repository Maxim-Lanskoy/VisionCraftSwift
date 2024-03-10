//
// Img2Video.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /img2video - Generate Video from Image

internal struct Img2VideoRequest: Codable {
    let token: String // (string) - your API key
    let image: String // (string) - your image in base64 format or URL to your image
    
    enum CodingKeys: String, CodingKey {
        case token
        case image
    }
}

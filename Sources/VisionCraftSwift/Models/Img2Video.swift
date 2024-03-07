//
// Img2Video.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /img2video - Generate Image Xl Route
// {
//  "token": "string",
//  "image": "string"
// }

internal struct Img2VideoRequest: Codable {
    let token: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case token
        case image
    }
}

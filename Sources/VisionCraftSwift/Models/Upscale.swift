//
// Upscale.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /upscale - Upscale
// {
//  "image": "string",
//  "token": "string"
// }

internal struct UpscaleRequest: Codable {
    let image: String
    let token: String
}

//
// Upscale.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: POST - /upscale - Upscale

internal struct UpscaleRequest: Codable {
    let image: String // (string) - your image in base64 format or URL to your image
    let token: String // (string) - your API key
}

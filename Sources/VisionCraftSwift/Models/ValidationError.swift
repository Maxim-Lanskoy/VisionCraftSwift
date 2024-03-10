//
// ValidationError.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: - Validation Error

public struct ValidationError: Codable {
    public let detail: [Detail] // (list) - list of validation errors
}

public struct SimpleError: Codable {
    public let error: String    // (string) - error message
}

public struct Detail: Codable {
    public let loc: [String]    // (list) - location of the error
    public let msg: String      // (string) - error message
    public let type: String     // (string) - type of the error
}

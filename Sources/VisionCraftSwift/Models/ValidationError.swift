//
// ValidationError.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

// MARK: - Validation Error
// {
//  "detail": [
//    {
//      "loc": [
//        "string",
//        0
//      ],
//      "msg": "string",
//      "type": "string"
//    }
//  ]
// }

public struct ValidationError: Codable {
    public let detail: [Detail]
}

public struct SimpleError: Codable {
    public let error: String
}

public struct Detail: Codable {
    public let loc: [String]
    public let msg: String
    public let type: String
}

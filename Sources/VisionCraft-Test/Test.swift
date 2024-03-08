//
// Test.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 09.03.2024.
//

import Foundation
import VisionCraftSwift
import AsyncHTTPClient

@main
class Test {
    static func main() async {
        let token: String = "80d0ce43-7a54-44e8-ad81-286775ef52bf"
        let client = HTTPClient(eventLoopGroupProvider: .singleton)
        do {
            let vision = try await VisionCraft(token: token, client: client)
            let image = try await vision.image(prompt: "Apple Swift AI robot.")
            print(String(describing: image))
            try await client.shutdown()
        } catch let error {
            fatalError(String(describing: error))
        }
    }
}


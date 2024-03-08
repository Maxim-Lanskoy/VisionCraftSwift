//
// VisionCraft.swift
// VisionCraftSwift
//
// Created by Maxim Lanskoy on 07.03.2024.
//

import AsyncHTTPClient

public struct VisionCraft {
    
    internal let token:         String
    internal let models:       [String]
    internal let samplers:     [String]
    internal let loras:        [String]
    internal let modelsXL:     [String]
    internal let samplersXL:   [String]
    internal let schedulersXL: [String]
    internal let modelsLLM:    [String]
    internal let schedulers:   [String]
    internal let refiners:     [String]
    internal var client:      HTTPClient
    
    internal var defaultNegative = """
    Ugly, Disfigured, Deformed, Low quality, Pixelated, Blurry, Grains, Text, Watermark, Signature, Out of frame, Disproportioned, Bad proportions, Gross proportions, Bad anatomy, Duplicate, Cropped, Extra hands, Extra arms, Extra legs, Extra fingers, Extra limbs, Long neck, Mutation, Mutilated, Mutated hands, Poorly drawn face, Poorly drawn hands, Missing hands, Missing arms, Missing legs, Missing fingers, Low resolution, Morbid.
    """
    
    public init(token: String, client: HTTPClient? = nil) async throws {
        let safeClient = client ?? HTTPClient(eventLoopGroupProvider: .singleton)
        self.token = token
        self.client = safeClient
        self.models = try await VisionCraftService.getModels(client: safeClient)
        self.samplers = try await VisionCraftService.getSamplers(client: safeClient)
        self.loras = try await VisionCraftService.getLoras(client: safeClient)
        self.modelsXL = try await VisionCraftService.getModelsXL(client: safeClient)
        self.samplersXL = try await VisionCraftService.getSamplersXL(client: safeClient)
        self.schedulersXL = try await VisionCraftService.getSchedulersXL(client: safeClient)
        self.modelsLLM = try await VisionCraftService.getModelsLLM(client: safeClient)
        self.schedulers = try await VisionCraftService.getSchedulers(client: safeClient)
        self.refiners = try await VisionCraftService.getRefiners(client: safeClient)
    }
    
    // Usage Examples:
    // let vision = try await VisionCraft(token: "80d0ce43-7a54-44e8-ad81-286775ef52bf")
    // let image = try await vision.image(prompt: "Cat")
    // let imageXL = try await vision.imageXL(prompt: "Cat", width: 512, height: 512)
    // let upscale = try await vision.upscale(image: image)
    // let messages = [LLMMessage.init(role: "user", content: "How?")]
    // let dialogue = try await vision.llm(messages: messages)
    // let whisper = try await vision.whisper(audio: nil)
    // let gif = try await vision.gif(prompt: "Cat")
    // let midjourney = try await vision.midJourney(prompt: "Cat")
    // let midjourneyResult = try await vision.midJourney(taskId: "133951")
    // let openjourney = try await vision.openJourney(prompt: "Cat")
    // let img2img = try await vision.img2img(image: imageXL, prompt: "Cat")
    // let img2video = try await vision.img2video(image: imageXL)
}

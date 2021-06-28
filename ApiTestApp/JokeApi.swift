//
//  JokeApi.swift
//  ApiTestApp
//
//  Created by Тарас Панин on 26.06.2021.
//

import Foundation


// MARK: - Joke
struct Joke: Codable {
    let error: Bool
    let category, type, setup, delivery, joke: String?
    let flags: Flags
    let safe: Bool
    let id: Int
    let lang: String
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
}

//
//  DataModel.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 07.07.2023.
//

import Foundation

// MARK: - Welcome
struct MainFlyInfo: Codable, Identifiable {
    
    var id = UUID().uuidString
    let passengersCount: Int
    let origin: Destination
    let destination: Destination
    let results: [ResultArray]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin, destination, results
    }
}

// MARK: - Destination
struct Destination: Codable {
    let iata: String
    let name: String
}

// MARK: - Result
struct ResultArray: Codable, Identifiable {
    
    let id: String
    let departureDateTime: String
    let arrivalDateTime: String
    let price: Price
    let airline: String
    let availableTicketsCount: Int
    var chipest: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case price, airline
        case availableTicketsCount = "available_tickets_count"
        case chipest
    }
}

// MARK: - Price
struct Price: Codable {
    let currency: String
    let value: Int
}


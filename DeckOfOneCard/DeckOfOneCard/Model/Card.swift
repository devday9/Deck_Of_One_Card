//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Deven Day on 9/22/20.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
    
//    struct Image: Decodable {
//        let png: URL
//    }
}

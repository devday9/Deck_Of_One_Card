//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Deven Day on 9/22/20.
//

import UIKit

class CardController {
    
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new")
    static let cardEndpoint = "draw"
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        
        // 1 - Prepare URL
        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        let finalURL = baseURL.appendingPathComponent(cardEndpoint)
        print(finalURL)
        
        // 2 - Fetch
        URLSession.shared.dataTask(with: finalURL) { (data,_, error) in
        
            // 3 - Handle Errors
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
        
            // 4 - Handle Data
            guard let data = data else {return completion(.failure(.invalidData))}
        
            // 5 - Decode
            do {
                let topLevel = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                guard let card = topLevel.cards.first else {return completion(.failure(.invalidData))}
                return completion(.success(card))
            } catch {
                print("There was an error: \(error.localizedDescription)")
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void) {
        
        // 1 - Prepare URL
        let imageURL = card.image
        // 2 - Fetch
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
        // 3 - Handle Error
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            // 4 - Handle Data
            guard let data = data else {return completion(.failure(.invalidData))}
            // 5 - Decode already decoded image so don't really need to decode anything.
            guard let image = UIImage(data: data) else {return completion(.failure(.invalidData))}
            return completion(.success(image))
        }.resume()
    }
}//END OF CLASS

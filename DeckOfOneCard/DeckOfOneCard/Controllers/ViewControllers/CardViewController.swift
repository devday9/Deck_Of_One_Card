//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Deven Day on 9/22/20.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(with: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
            }
        }
    }
}//END OF CLASS

    //MARK: - Helper Functions
func fetchImageAndUpdateView(with card: Card) {
    
    CardController.fetchImage(for: card) { [weak self] (result) in
        
        DispatchQueue.main.async {
            
            switch result {
            case .success(let image):
                self?.cardLabel.text = "\(card.value) of \(card.suit)"
                self?.cardImageView.image = image
                
            case .failure(let error):
                self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}




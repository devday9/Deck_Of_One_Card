//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by Deven Day on 9/22/20.
//

import UIKit

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        
        // Alert from error
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
       // Dismiss action
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        
        // Present Alert
        present(alertController, animated: true)
    }
}

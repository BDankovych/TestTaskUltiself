//
//  UIViewController + Alert.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import UIKit

extension UIViewController {
    func displayAlert(with error: Error) {
        let alertVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}

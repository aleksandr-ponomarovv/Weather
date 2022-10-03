//
//  UIImageView+Extension.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import UIKit

extension UIImageView {
    func downloadImage(urlString: String) {
        ImageProvider.shared.fetchImage(urlString: urlString) { image in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.image = image
            }
        }
    }
}

//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import UIKit

protocol CityTableViewCellModel {
    var name: String { get }
    var iconUrl: String { get }
}

final class CityTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    var model: CityTableViewCellModel? {
        willSet(model) {
            guard let model = model else { return }
            
            nameLabel.text = model.name
            iconImageView.downloadImage(urlString: model.iconUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
    }
}

// MARK: - Private methods
private extension CityTableViewCell {
    func setupUI() {
        selectionStyle = .none
        iconImageView.layer.cornerRadius = 3
    }
}

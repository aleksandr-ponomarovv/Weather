//
//  DescriptionTableViewCell.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import UIKit

protocol DescriptionTableViewCellModel {
    var title: String { get }
    var value: String { get }
}

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    var model: DescriptionTableViewCellModel? {
        willSet(model) {
            titleLabel.text = model?.title
            valueLabel.text = model?.value
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}

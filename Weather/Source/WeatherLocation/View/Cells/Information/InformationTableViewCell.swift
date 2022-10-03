//
//  InformationTableViewCell.swift
//  Weather
//
//  Created by Aleksandr on 03.10.2022.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        willSet(title) {
            titleLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}

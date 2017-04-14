//
//  KPNewsLikersListCell.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsLikersListCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 15
    }

    var likersItem: KPNewsLikersItem! {
        didSet {
            
            if let url = likersItem.avatar {
                
                iconImageView.kf.setImage(with: URL(string: url))
            }
            nameLabel.text = likersItem.username
        }
    }
    
}

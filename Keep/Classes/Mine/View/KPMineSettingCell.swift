//
//  KPMineSettingCell.swift
//  Keep
//
//  Created by Damon on 17/3/9.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPMineSettingCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageView = UIImageView.init(image: UIImage.stretchImage("under"))
        self.backgroundView = imageView
    }
    
}

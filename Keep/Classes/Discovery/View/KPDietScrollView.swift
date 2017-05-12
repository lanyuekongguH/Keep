//
//  KPDietScrollView.swift
//  Keep
//
//  Created by Damon on 17/5/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDietScrollView: UIScrollView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        
    }
    
    var diets: [KPDietSingleItem]? {
        
        didSet {
            
            if let diets = diets {
                
                var imageNames = Array<String>()
                for item in diets {
                    
                    if let cover = item.cover {
                        imageNames.append(cover)
                    }
                }
                
                let imageSize = CGSize(width: 120, height: 120)
                self.contentSize = CGSize(width: (imageSize.width + 10) *  CGFloat(imageNames.count) + 10, height: imageSize.height)
                
                for i in 0..<imageNames.count {
                    
                    let imageView = UIImageView()
                    imageView.contentMode = .scaleAspectFill
                    imageView.isUserInteractionEnabled = true
                    imageView.kf.setImage(with: URL(string: imageNames[i]))
                    addSubview(imageView)
                    
                    let nameLabel = UILabel()
                    nameLabel.font = UIFont.systemFont(ofSize: 14)
                    nameLabel.textColor = KPTheme()
                    
                    let calorieLabel = UILabel()
                    calorieLabel.font = UIFont.systemFont(ofSize: 10)
                    calorieLabel.textColor = KPGray()
                    
                    imageView.addSubview(nameLabel)
                    imageView.addSubview(calorieLabel)
                    
                    if let name = diets[i].name, let calorie = diets[i].calorie {
                        
                        nameLabel.text = name
                        calorieLabel.text = "\(calorie) kcal"
                    }

                    imageView.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(CGFloat(i) * (imageSize.width + 10) + 10)
                        make.width.equalTo(imageSize.width)
                        make.height.equalTo(imageSize.height)
                        make.top.equalTo(0)
                    })
                    
                    nameLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(0)
                        make.width.equalTo(imageSize.width)
                        make.height.equalTo(15)
                        make.top.equalTo(imageView.snp.bottom).offset(5)
                    })
                    
                    calorieLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(0)
                        make.width.equalTo(imageSize.width)
                        make.height.equalTo(12)
                        make.top.equalTo(nameLabel.snp.bottom).offset(2)
                    })
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

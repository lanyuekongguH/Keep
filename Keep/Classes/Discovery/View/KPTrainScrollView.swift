//
//  KPTrainScrollView.swift
//  Keep
//
//  Created by Damon on 17/5/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTrainScrollView: UIScrollView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        
    }
    
    var plans: [KPDiscoveryPlanItem]? {
        
        didSet {
            
            if let plans = plans {
                
                var imageNames = Array<String>()
                for item in plans {
                    imageNames.append(item.picture!)
                }
                
                let imageSize = CGSize(width: 250, height: 120)
                self.contentSize = CGSize(width: imageSize.width *  CGFloat(imageNames.count), height: imageSize.height)
                
                for i in 0..<imageNames.count {
                    
                    let imageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(i) * imageSize.width, y: 0, width: imageSize.width, height: imageSize.height)
                    imageView.contentMode = .scaleAspectFill
                    imageView.isUserInteractionEnabled = true
                    imageView.kf.setImage(with: URL(string: imageNames[i]))
                    addSubview(imageView)
                    
                    
                    let titleNameLabel = UILabel()
                    titleNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
                    titleNameLabel.textColor = UIColor.white
                    
                    let pioneerLabel = UILabel()
                    pioneerLabel.font = UIFont.systemFont(ofSize: 10)
                    pioneerLabel.textColor = UIColor.white
                    
                    let difficultyLabel = UILabel()
                    difficultyLabel.font = UIFont.boldSystemFont(ofSize: 15)
                    difficultyLabel.textColor = UIColor.white
                    
                    let averageDurationLabel = UILabel()
                    averageDurationLabel.font = UIFont.systemFont(ofSize: 12)
                    averageDurationLabel.textColor = UIColor.white
                    
                    imageView.addSubview(titleNameLabel)
                    imageView.addSubview(pioneerLabel)
                    imageView.addSubview(difficultyLabel)
                    imageView.addSubview(averageDurationLabel)
                    
                    if let title = plans[i].title, let pioneer = plans[i].pioneer, let difficulty = plans[i].difficulty, let averageDuration = plans[i].averageDuration {
                        
                        titleNameLabel.text = title
                        pioneerLabel.text = "\(pioneer) 人已参加"
                        difficultyLabel.text = "K\(difficulty)"
                        averageDurationLabel.text = "\(averageDuration)分钟"
                    }
                    
                    titleNameLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(20)
                        make.width.equalTo(200)
                        make.height.equalTo(24)
                        make.top.equalTo(20)
                    })
                    
                    pioneerLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(titleNameLabel)
                        make.width.equalTo(titleNameLabel)
                        make.height.equalTo(12)
                        make.top.equalTo(titleNameLabel.snp.bottom).offset(4)
                    })
                    
                    difficultyLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(titleNameLabel)
                        make.width.equalTo(20)
                        make.height.equalTo(25)
                        make.top.equalTo(pioneerLabel.snp.bottom).offset(30)
                    })
                    
                    averageDurationLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(difficultyLabel.snp.right).offset(5)
                        make.width.equalTo(100)
                        make.height.equalTo(20)
                        make.top.equalTo(pioneerLabel.snp.bottom).offset(33.5)
                    })
                    
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

//
//  KPDiscoveryDietCell.swift
//  Keep
//
//  Created by Damon on 17/5/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryDietCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(dietScrollView)
        contentView.addSubview(lineView)
        contentView.addSubview(contentLabel)
    }
    
    var diet:KPDietItem? {
        
        didSet {
            
            if let diet = diet {
                
                if let name = diet.name, let content = diet.content, let recipes = diet.recipes {
                
                    titleLabel.text = name
                    contentLabel.text = content
                    dietScrollView.diets = recipes
                }
                
                self.titleLabel.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(10)
                    make.width.equalTo(200)
                    make.height.equalTo(40)
                    make.top.equalTo(0)
                })
                
                self.arrowButton.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(SCREENW - 30)
                    make.width.equalTo(30)
                    make.height.equalTo(40)
                    make.top.equalTo(0)
                })
                
                self.dietScrollView.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(0)
                    make.width.equalTo(SCREENW)
                    make.height.equalTo(120 + 15 + 5 + 12 + 2)
                    make.top.equalTo(self.titleLabel.snp.bottom)
                })
                
                self.lineView.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(10)
                    make.width.equalTo(SCREENW-10)
                    make.height.equalTo(0.5)
                    make.top.equalTo(self.dietScrollView.snp.bottom).offset(0)
                })
                
                let contentSize = diet.content?.boundingRectWithSize(CGSize.init(width: SCREENW - 20, height: 9999), contentLabel.font)

                if let contentSize = contentSize {
                
                    self.contentLabel.snp.makeConstraints({ (make) in
                        
                        make.left.equalTo(10)
                        make.width.equalTo(contentSize.width)
                        make.height.equalTo(contentSize.height)
                        make.top.equalTo(self.lineView.snp.bottom).offset(10)
                    })
                }
            }
        }
    }
    
    override func prepareForReuse() {
        
        let array = self.dietScrollView.subviews
        
        for v in array {
        
            v.removeFromSuperview()
        }
    }
    
    class func heightOfDietCell(_ item: KPDietItem?) -> CGFloat {
        
        if let item = item {
            
            let contentSize = item.content?.boundingRectWithSize(CGSize(width: SCREENW - 20, height: 9999), UIFont.boldSystemFont(ofSize: 12))

            if let contentSize = contentSize {
            
                return 40 + 120 + 15 + 5 + 12 + 2 + 10 + contentSize.height + 10
            } else {
            
                return 40 + 120 + 10
            }
        }
        
        return 0.1
    }
    
    fileprivate lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = KPTheme()
        return titleLabel
    }()
    
    fileprivate lazy var arrowButton: UIButton = {
        
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(named: "arrow_more"), for: .normal)
        arrowButton.setImage(UIImage(named: "arrow_more"), for: .highlighted)
        return arrowButton
    }()
    
    fileprivate lazy var dietScrollView: KPDietScrollView = {
        
        let dietScrollView = KPDietScrollView()
        return dietScrollView
    }()
    
    fileprivate lazy var lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = KPLine()
        return lineView
    }()
    
    fileprivate lazy var contentLabel: UILabel = {
        
        let contentLabel = UILabel()
        contentLabel.font = UIFont.boldSystemFont(ofSize: 12)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = KPTheme()
        return contentLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

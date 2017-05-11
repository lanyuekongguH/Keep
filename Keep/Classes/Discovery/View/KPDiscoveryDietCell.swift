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
        contentView.addSubview(timerScrollView)
        contentView.addSubview(lineView)
        contentView.addSubview(contentLabel)
    }
    
    var diet:KPDietItem? {
        
        didSet {
            
            if let diet = diet {
                
                
                if let content = diet.content {
                
                    contentLabel.text = content
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
                
                self.timerScrollView.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(0)
                    make.width.equalTo(SCREENW)
                    make.height.equalTo(120)
                    make.top.equalTo(self.titleLabel.snp.bottom).offset(0)
                })
                
                self.lineView.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(10)
                    make.width.equalTo(SCREENW-10)
                    make.height.equalTo(0.5)
                    make.top.equalTo(self.timerScrollView.snp.bottom).offset(0)
                })
                
                let contentSize = contentLabel.text?.boundingRectWithSize(CGSize.init(width: SCREENW - 20, height: 9999), contentLabel.font)

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
    
    fileprivate lazy var timerScrollView: KPTimerScrollView = {
        
        let timerScrollView = KPTimerScrollView()
        return timerScrollView
    }()
    
    fileprivate lazy var lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = KPLightGray()
        return lineView
    }()
    
    fileprivate lazy var contentLabel: UILabel = {
        
        let contentLabel = UILabel()
        contentLabel.font = UIFont.boldSystemFont(ofSize: 12)
        contentLabel.textColor = KPTheme()
        return contentLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

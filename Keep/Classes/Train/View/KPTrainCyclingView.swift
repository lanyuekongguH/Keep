//
//  KPTrainCyclingView.swift
//  Keep
//
//  Created by Damon on 17/5/17.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

protocol TrainCyclingDelegate: NSObjectProtocol {
    func TrainCyclingDelegate(_ view:KPTrainCyclingView, button:UIButton)
}

class KPTrainCyclingView: UIScrollView {

    weak var cyclingDelegate: TrainCyclingDelegate?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    fileprivate func setupUI() {

        let frame = self.frame
        addSubview(bgImageView)
        addSubview(cyclingButton)
        cyclingButton.addSubview(cyclingImageView)

        bgImageView.snp.makeConstraints({ (make) in
            
            make.left.equalTo(0)
            make.width.equalTo(frame.size.width)
            make.height.equalTo(frame.size.height)
            make.top.equalTo(0)
        })
        
        cyclingButton.snp.makeConstraints({ (make) in
            
            make.left.equalTo(0)
            make.width.equalTo(SCREENW)
            make.height.equalTo(64)
            make.top.equalTo(frame.size.height - 64)
        })
        
        cyclingImageView.snp.makeConstraints({ (make) in
            
            make.left.equalTo(SCREENW-50)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.top.equalTo((64 - 50)/2.0)
        })
        
    }
    
    @objc fileprivate func buttonClick(_ button:UIButton) {
    
        cyclingDelegate?.TrainCyclingDelegate(self, button: button)
    }
    
    fileprivate lazy var bgImageView: UIImageView = {
        
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "bg_cycling_map")
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    fileprivate lazy var cyclingButton: UIButton = {
        
        let cyclingButton = UIButton()
        cyclingButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        cyclingButton.setBackgroundImage(UIImage.createImage(KPGreen()), for: UIControlState())
        cyclingButton.setBackgroundImage(UIImage.createImage(KPGreen()), for: .highlighted)
        cyclingButton.setTitle("出发去骑行", for: UIControlState())
        cyclingButton.setTitleColor(UIColor.white, for: UIControlState())
        cyclingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return cyclingButton
    }()
    
    fileprivate lazy var cyclingImageView: UIImageView = {
        
        let cyclingImageView = UIImageView()
        cyclingImageView.image = UIImage(named: "icon_camera_tab_cycling")
        cyclingImageView.isUserInteractionEnabled = true
        return cyclingImageView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

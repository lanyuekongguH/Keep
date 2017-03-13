//
//  KPSegmentView.swift
//  Keep
//
//  Created by Damon on 17/3/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

protocol KPSegmentViewDelegate: NSObjectProtocol {
    func segmentView(_ segmentView:KPSegmentView, button:UIButton)
}

class KPSegmentView: UIView {

    weak var delegate: KPSegmentViewDelegate?
    
    var titiles: Array<Any>? {
        didSet {
            
            if (titiles?.count)! < 2 {
                return
            }
            
            leftButton.setTitle(titiles?[0] as! String? , for: UIControlState())
            rightButton.setTitle(titiles?[1] as! String?, for: UIControlState())

        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        addSubview(leftButton)
        
        addSubview(rightButton)
        
        addSubview(bottomView)
        
        leftButton.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(25)
            make.top.equalTo(10)
            make.left.equalTo(0)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(25)
            make.top.equalTo(10)
            make.left.equalTo(leftButton.snp.right).offset(20)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(2)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
        }
    }
    
    fileprivate lazy var leftButton: UIButton = {
    
        let leftButton = UIButton()
        leftButton.tag = 1
        leftButton.setTitleColor(UIColor.white, for: UIControlState())
        leftButton.addTarget(self, action: #selector(segmentButtonClick(_:)), for: .touchUpInside)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return leftButton
    }()
    
    fileprivate lazy var rightButton: UIButton = {
        
        let rightButton = UIButton()
        rightButton.tag = 2
        rightButton.setTitleColor(UIColor.white, for: UIControlState())
        rightButton.addTarget(self, action: #selector(segmentButtonClick(_:)), for: .touchUpInside)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return rightButton
    }()
    
    fileprivate lazy var bottomView: UIView = {
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.white
        return bottomView
    }()
    
    func segmentButtonClick(_ button:UIButton) {
    
        if button.tag == 1 {
        
            UIView.animate(withDuration: 0.25, animations: {
                self.bottomView.snp.remakeConstraints({ (make) in
                    
                    make.left.equalTo(self.leftButton.snp.left)
                    make.width.equalTo(30)
                    make.height.equalTo(2)
                    make.bottom.equalTo(0)
                })
                self.layoutIfNeeded()
            })
            
        } else {
        
            UIView.animate(withDuration: 0.25, animations: {
                self.bottomView.snp.remakeConstraints({ (make) in
                    
                    make.left.equalTo(self.rightButton.snp.left)
                    make.width.equalTo(30)
                    make.height.equalTo(2)
                    make.bottom.equalTo(0)
                })
                self.layoutIfNeeded()
            })
        }
        
        delegate?.segmentView(self, button: button)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

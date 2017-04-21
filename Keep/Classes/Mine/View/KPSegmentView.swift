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
    
    init(frame:CGRect,_ titles:[String]) {
    
        let W = titles.count * (40 + 20) - 20
        let cgrect = CGRect.init(x: 0, y: 0, width: W, height: Int(frame.size.height))
        
        super.init(frame: cgrect)
        
        for i in 0...titles.count - 1 {
            
            let button = UIButton()
            button.tag = i
            button.setTitle(titles[i], for: UIControlState())
            button.addTarget(self, action: #selector(segmentButtonClick(_:)), for: .touchUpInside)
            button.setTitleColor(UIColor.white, for: UIControlState())
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.frame = CGRect(x: i * (40 + 20), y: 10, width: 40, height: 25)
            addSubview(button)
        }
        
        addSubview(bottomView)
        
        bottomView.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(2)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
        }
        
    }
    
    var offsetRate: CGFloat? {
        didSet {
            
            guard let offsetRate = offsetRate else {
                return
            }
            
            self.bottomView.snp.remakeConstraints({ (make) in
                
                make.left.equalTo(offsetRate * (40 + 20) + 5)
                make.width.equalTo(30)
                make.height.equalTo(2)
                make.bottom.equalTo(0)
            })
        }
    }
    
    fileprivate lazy var bottomView: UIView = {
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.white
        return bottomView
    }()
    
    func segmentButtonClick(_ button:UIButton) {
    
        UIView.animate(withDuration: 0.25, animations: {
            self.bottomView.snp.remakeConstraints({ (make) in
                
                make.left.equalTo(button.tag * (40 + 20) + 5)
                make.width.equalTo(30)
                make.height.equalTo(2)
                make.bottom.equalTo(0)
            })
            self.layoutIfNeeded()
        })
        
        delegate?.segmentView(self, button: button)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

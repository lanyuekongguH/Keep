//
//  KPNewsHotBottomView.swift
//  Keep
//
//  Created by Damon on 17/4/19.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

protocol KPNewsHotBottomButtonDelegate: NSObjectProtocol {
    func newsHotBottomButton(_ bottomView:KPNewsHotBottomView, button:UIButton)
}

class KPNewsHotBottomView: UIView {

    public enum ButtonType : Int {
        
        case favorited
        
        case comment
        
        case share
        
        case more
    }
    
    weak var delegate: KPNewsHotBottomButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(favoritedButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(moreButton)
        
        favoritedButton.snp.updateConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(15)
            make.left.equalTo(20)
        }
        
        commentButton.snp.updateConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(15)
            make.left.equalTo(favoritedButton.snp.right).offset(20)
        }
        
        shareButton.snp.updateConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(15)
            make.left.equalTo(commentButton.snp.right).offset(20)
        }
        
        moreButton.snp.updateConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(15)
            make.left.equalTo(SCREENW - 30 - 20)
        }
    }
    
    fileprivate lazy var favoritedButton: UIButton = {
        
        let favoritedButton = UIButton()
        favoritedButton.tag = ButtonType.favorited.rawValue
        favoritedButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        favoritedButton.setImage(UIImage(named: "icon_timeline_like"), for: .normal)
        favoritedButton.setImage(UIImage(named: "icon_timeline_like"), for: .highlighted)
        return favoritedButton
    }()
    
    fileprivate lazy var commentButton: UIButton = {
        
        let commentButton = UIButton()
        commentButton.tag = ButtonType.comment.rawValue
        commentButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        commentButton.setImage(UIImage(named: "icon_timeline_comment"), for: .normal)
        commentButton.setImage(UIImage(named: "icon_timeline_comment"), for: .highlighted)
        return commentButton
    }()
    
    fileprivate lazy var shareButton: UIButton = {
        
        let shareButton = UIButton()
        shareButton.tag = ButtonType.share.rawValue
        shareButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        shareButton.setImage(UIImage(named: "icon_timeline_share"), for: .normal)
        shareButton.setImage(UIImage(named: "icon_timeline_share"), for: .highlighted)
        return shareButton
    }()
    
    fileprivate lazy var moreButton: UIButton = {
        
        let moreButton = UIButton()
        moreButton.tag = ButtonType.more.rawValue
        moreButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        moreButton.setImage(UIImage(named: "icon_timeline_more"), for: .normal)
        moreButton.setImage(UIImage(named: "icon_timeline_more"), for: .highlighted)
        return moreButton
    }()
    
    func buttonClick(_ button:UIButton) {
        
        delegate?.newsHotBottomButton(self, button: button)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

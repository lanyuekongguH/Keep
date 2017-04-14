//
//  KPStoreTabView.swift
//  Keep
//
//  Created by Damon on 17/3/14.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

protocol KPStoreTabViewDelegate:NSObjectProtocol {
    func storeTabView(_ tabView:KPStoreTabView, button:UIButton)
}

class KPStoreTabView: UIView {

    weak var delegate: KPStoreTabViewDelegate?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
    
    }
    
    var titles: [String]? {
        didSet {
    
            if let titles = titles {
            
                let buttonW = SCREENW / CGFloat((titles.count))
                
                for index in 0...((titles.count)-1) {
                    
                    let button = UIButton()
                    button.tag = index
                    button.setTitle(titles[index], for: UIControlState())
                    button.setTitleColor(KPTheme(), for: .selected)
                    button.setTitleColor(KPGray(), for: UIControlState())
                    button.frame = CGRect.init(x: CGFloat(index) * buttonW, y: 0, width: buttonW, height: 40)
                    button.addTarget(self, action: #selector(selectedButtonClick(_:)), for: .touchUpInside)
                    addSubview(button)
                }
                
                addSubview(selectedView)
                
                selectedView.frame = CGRect.init(x: (buttonW-60)/2.0, y: 38, width: 60, height: 2)
            }
        }
    }
    
    func selectedButtonClick(_ button:UIButton) {
        
        let index = button.tag
        
        let buttonW = SCREENW / CGFloat((titles?.count)!)

        selectedView.frame = CGRect.init(x: (buttonW-60)/2.0 + buttonW * CGFloat(index), y: 38, width: 60, height: 2)

        delegate?.storeTabView(self, button: button)
    }
    
    fileprivate lazy var selectedView: UIView = {
    
        let selectedView = UIView()
        selectedView.backgroundColor = KPGreen()
        return selectedView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}

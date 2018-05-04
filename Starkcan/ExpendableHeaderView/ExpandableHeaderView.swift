//
//  ExpandableHeaderView.swift
//  Starkcan
//
//  Created by NTGMM-01 on 01/05/18.
//  Copyright © 2018 Starkcan. All rights reserved.
//

import UIKit
protocol ExpandableHeaderViewDelegate {
    func toggleSection(header:UITableViewHeaderFooterView,section: Int)
    
}
class ExpandableHeaderView: UITableViewHeaderFooterView {
    var delegate: ExpandableHeaderViewDelegate?
    var section:Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(selectHeaderAction)))
    
        
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer)
    {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        
        delegate?.toggleSection(header: self, section: cell.section)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(title:String, section:Int!, delegate:ExpandableHeaderViewDelegate)
    {
       // self.textLabel?.text = title
        
        let label = UILabel()
        
        label.frame = CGRect(x: 45, y:5, width:140, height:35)
        let headerFont = UIFont(name: "Lato-Regular", size: 20)
        label.font = headerFont
        label.text = title
        
        self.addSubview(label)
        
        self.section = section
        self.delegate = delegate
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       // self.textLabel?.textColor = UIColor.white
       // self.contentView.backgroundColor =  UIColor(red:45/255, green: 20/255, blue:16/255, alpha:1)//UIColor.brown
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

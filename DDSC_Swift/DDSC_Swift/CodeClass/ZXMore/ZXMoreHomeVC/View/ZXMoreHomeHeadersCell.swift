//
//  ZXMoreHomeHeadersCell.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/12/17.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXMoreHomeHeadersCell: BaseTableViewCell {

    var leftImage        : UIImageView?
    var rightImageTop    : UIImageView?
    var rightImageBottom : UIImageView?
    var grayView         : UIView?
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.backgroundColor = UIColor.color(hexString: "#EFEFEF")
        self.setUI()
        
    }
    
    func setUI() {
        leftImage                         = UIImageView()
        self.contentView.addSubview(leftImage!)
        leftImage?.backgroundColor        = UIColor.red
        leftImage?.snp.makeConstraints { (make) in
            make.width.equalTo(ZX_WIDTH / 2 -  1)
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView)
        }
        
        rightImageTop                     = UIImageView()
        self.contentView.addSubview(rightImageTop!)
        rightImageTop?.backgroundColor    = UIColor.yellow
        rightImageTop?.snp.makeConstraints({ (make) in
            make.top.right.equalTo(self.contentView)
           // make.height.equalTo(140 / 2 - 1)
            make.left.equalTo(self.leftImage!.snp.right).offset(1)
            
        })
        
        rightImageBottom                  = UIImageView()
        self.contentView.addSubview(rightImageBottom!)
        rightImageBottom?.backgroundColor = UIColor.green
        rightImageBottom?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.leftImage!.snp.right).offset(1)
            make.width.height.equalTo(self.rightImageTop!)
            make.top.equalTo(self.rightImageTop!.snp.bottom).offset(1)
            make.bottom.equalTo(self.contentView)
        })
        
        grayView                          = UIView()
        self.contentView.addSubview(grayView!)
        grayView?.backgroundColor         = UIColor.color(hexString: "#EFEFEF")
        grayView?.snp.makeConstraints({ (make) in
            make.height.equalTo(15)
            make.left.right.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView.snp.bottom)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

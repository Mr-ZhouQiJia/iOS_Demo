//
//  ZXMoreHomeSecondCell.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/12/18.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXMoreHomeSecondCell: BaseTableViewCell {

    var myScrollView : ZXSpecialCycleScrollView?
    var label : UILabel?
    var turnBtn : UIButton?
    var bgView : UIView?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.bgView = UIView()
        self.contentView.addSubview(self.bgView!)
        bgView?.snp.makeConstraints({ (make) in
            make.top.left.right.equalTo(self.contentView)
            make.height.equalTo(45)
        })
        
        self.label = UILabel()
        self.contentView.addSubview(self.label!)
        self.label?.text = "热门活动"
        self.label?.textColor = UIColor.color(hexString: "555555")
        self.label?.font = UIFont.systemFont(ofSize: 17)
        self.label?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.bgView!).offset(15)
            make.centerY.equalTo(self.bgView!)
            make.width.equalTo(100)
            make.height.equalTo(19)
        })
        
        self.turnBtn = UIButton.init(type: .custom)
        self.contentView.addSubview(self.turnBtn!)
        self.turnBtn!.snp.makeConstraints { (make) in
            make.right.equalTo(self.bgView!.snp.right).offset(-9)
            make.centerY.equalTo(self.label!)
            make.width.equalTo(9)
            make.height.equalTo(17)
        }
        self.turnBtn?.setImage(UIImage.init(named: "icon_arrow"), for: .normal)
        
        myScrollView = ZXSpecialCycleScrollView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 45), size: CGSize.init(width: ZX_WIDTH, height: 90)))
        myScrollView?.scrollViewSize = CGSize.init(width: 255 + 10, height: 85)
        myScrollView!.records = [
                                "http://d.hiphotos.baidu.com/image/pic/item/91ef76c6a7efce1b5ef04082a251f3deb58f659b.jpg",
                                 "http://d.hiphotos.baidu.com/image/pic/item/bd315c6034a85edfb6409e6444540923dc5475ac.jpg",
                                 "http://c.hiphotos.baidu.com/image/pic/item/c75c10385343fbf2283e2f6bbd7eca8065388f6c.jpg",
                                 "http://c.hiphotos.baidu.com/image/pic/item/a5c27d1ed21b0ef46925f819d0c451da80cb3ea3.jpg"]
        self.contentView.addSubview(myScrollView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

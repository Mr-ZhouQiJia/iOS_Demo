//
//  ZXMoreHomeNewsCell.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/30.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXMoreHomeNewsCell: BaseTableViewCell {
    
    var picture  : UIImageView?
    var date     : UILabel?
    var title    : UILabel?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.setUI()
    }
    func setUI() {
        picture = UIImageView()
        self.contentView.addSubview(picture!)
        picture?.backgroundColor = UIColor.red
        self.picture?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-15)
            make.width.equalTo(90)
            make.height.equalTo(70)
            make.centerY.equalTo(self.contentView)
        })

        title                  = UILabel()
        self.contentView.addSubview(title!)
        title?.backgroundColor = UIColor.yellow
        title?.numberOfLines   = 2
        title?.font            = UIFont.systemFont(ofSize : 14)
        title?.text            = "123eqwjrn;kwqerbfsdmafs;akfsad'f'rjewq;rnakfcxbffhw;ekdasndfafhbjfkdfbakj"
        self.title?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.picture!.snp.left).offset(-15)
            make.centerY.equalTo(self.contentView)
        })
        
        date = UILabel()
        self.contentView.addSubview(date!)
        date?.font = UIFont.systemFont(ofSize: 12)
        date?.backgroundColor = UIColor.blue
        date?.text = "2018-11-28"
        date?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.title!)
            make.bottom.equalTo(self.contentView).offset(-10)
        })
        
       
        
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

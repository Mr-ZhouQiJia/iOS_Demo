//
//  ZXMoreHomeNewsCell.swift
//  DDSC_Swift
//
//  Created by ddsc on 2018/11/30.
//  Copyright © 2018 ddsc. All rights reserved.
//

import UIKit

class ZXMoreHomeNewsCell: BaseTableViewCell {
    
    var picture: UIImageView?
    var date : String?
    var title : String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    func setUI() {
        picture = UIImageView()
        self.contentView.addSubview(picture!)
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

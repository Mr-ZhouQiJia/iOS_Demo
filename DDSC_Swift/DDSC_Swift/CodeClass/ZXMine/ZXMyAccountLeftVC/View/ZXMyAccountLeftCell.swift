//
//  ZXMyAccountLeftCell.swift
//  DDSC_Swift
//
//  Created by ddsc on 2019/1/16.
//  Copyright © 2019 ddsc. All rights reserved.
//

import UIKit

class ZXMyAccountLeftCell: BaseTableViewCell {
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var bankLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.color(hexString: "e1e6e9")
        self.bankLB.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  SendTableViewCell.swift
//  Messager
//
//  Created by Vladimir Nevinniy on 19.03.17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit

class SendTableViewCell: UITableViewCell {
    @IBOutlet weak var avatar: MyImageView!
    @IBOutlet weak var message: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

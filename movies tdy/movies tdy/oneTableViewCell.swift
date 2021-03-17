//
//  oneTableViewCell.swift
//  movies tdy
//
//  Created by apple on 09/01/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class oneTableViewCell: UITableViewCell {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var l1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  LatestTableViewCell.swift
//  DcardJson
//
//  Created by JillOU on 2020/8/18.
//  Copyright © 2020 Jillou. All rights reserved.
//

import UIKit

class LatestTableViewCell: UITableViewCell {

    @IBOutlet weak var forumnameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var likecountLabel: UILabel!
    @IBOutlet weak var commentcountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

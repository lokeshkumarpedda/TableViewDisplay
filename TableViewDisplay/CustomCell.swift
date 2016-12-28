//
//  CustomCell.swift
//  TableViewDisplay
//
//  Created by Next on 22/12/16.
//  Copyright © 2016 Next. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var population: UILabel!
    
    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

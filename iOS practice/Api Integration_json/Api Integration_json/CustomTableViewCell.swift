//
//  CustomTableViewCell.swift
//  Api Integration_json
//
//  Created by patururamesh on 21/11/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var Apiimageview: UIImageView!
    @IBOutlet weak var label : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MyTableViewCell.swift
//  Pr.5 (GetApi)
//
//  Created by Choudhary Dipika on 25/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var flagimage: UIImageView!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

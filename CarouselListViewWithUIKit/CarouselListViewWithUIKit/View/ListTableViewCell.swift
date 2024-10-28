//
//  ListTableViewCell.swift
//  CarouselListViewWithUIKit
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

//
//  CharacterListTableViewCell.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//

import UIKit
import SDWebImage

class CharacterListTableViewCell: UITableViewCell {

    static let cellId = "CharacterListTableViewCell"
    
    @IBOutlet weak var characterThumb: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData(character: CharacterElement) {
        if let url = URL(string: character.img!) {
            characterThumb.sd_setImage(with: url, completed: nil)
        }

        displayNameLabel.text = character.name
    }
    
}

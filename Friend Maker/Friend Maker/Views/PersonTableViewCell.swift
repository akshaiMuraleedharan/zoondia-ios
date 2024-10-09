//
//  TableViewCell.swift
//  Friend Maker
//
//  Created by Subhosting's MacBook Pro on 09/10/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    //MARK: - Outlets and Properties
    @IBOutlet weak var hexIconImageView: UIImageView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configUser(_ user: Person) {
        nameLabel.text = user.name
        placeLabel.text = user.place
        designationLabel.text = user.designation
        addButton.isSelected = user.isLiked
        if let avatar = user.avatar {
            profilePicImageView.load(url: URL(string: avatar)!)
        }
        
        
    }
}

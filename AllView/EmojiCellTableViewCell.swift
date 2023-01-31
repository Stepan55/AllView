//
//  EmojiCellTableViewCell.swift
//  AllView
//
//  Created by Степан on 21.01.2023.
//

import UIKit

class EmojiCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameEmojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(obj: Emoji) {
        emojiLabel.text = obj.emoji
        descriptionLabel.text = obj.explain
        nameEmojiLabel.text = obj.name
    }
}

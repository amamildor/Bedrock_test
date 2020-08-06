//
//  TextImageCell.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

class TextImageCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        selectedBackgroundView = UIView()
        backgroundColor = theme.colors.cellBackground
        itemNameLabel.textColor = theme.colors.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectedBackgroundView!.backgroundColor = selected ? theme.colors.cellSelectBackground : nil
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        backgroundColor = highlighted ? theme.colors.cellHighlightBackground : theme.colors.cellBackground
    }
}

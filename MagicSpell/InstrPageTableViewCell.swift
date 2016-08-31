//
//  InstrPageTableViewCell.swift
//  MagicSpell
//
//  Created by Lingyi Li on 8/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import UIKit

class InstrPageTableViewCell: UITableViewCell {

    var imageViewForIcon: UIImageView!
    var labelForInstruction : UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeView() {
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        imageViewForIcon = UIImageView()
        self.addSubview(imageViewForIcon)
        labelForInstruction = UILabel()
        labelForInstruction.font = UIFont.systemFontOfSize(12)
        self.addSubview(labelForInstruction)
        
    }
    
    override func layoutSubviews() {
        imageViewForIcon.left = 5
        imageViewForIcon.top = 2
        imageViewForIcon.width = 25
        imageViewForIcon.height = 25
        
        labelForInstruction.sizeToFit()
        labelForInstruction.left = (imageViewForIcon.right) + 10
        labelForInstruction.top = self.contentView.height/2 - (labelForInstruction.height)/2
    }


}

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
        labelForInstruction.font = UIFont.systemFontOfSize(15)
        self.addSubview(labelForInstruction)
    }
    
    override func layoutSubviews() {
        imageViewForIcon.setWidth(25)
        imageViewForIcon.setHeight(25)
        imageViewForIcon.setLeft(5)
        imageViewForIcon.setTop(self.contentView.height/2 - imageViewForIcon.height/2)
        
        labelForInstruction.sizeToFit()
        labelForInstruction.setLeft((imageViewForIcon.right) + 10)
        labelForInstruction.setTop(self.contentView.height/2 - (labelForInstruction.height)/2)
    }
}

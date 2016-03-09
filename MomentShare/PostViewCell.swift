//
//  PostViewCell.swift
//  MomentShare
//
//  Created by Shivam Bharuka on 3/6/16.
//  Copyright © 2016 Shivam Bharuka. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostViewCell: UITableViewCell {

    @IBOutlet weak var FeedPic: PFImageView!
    @IBOutlet weak var caption: UILabel!

    var instagramPost: PFObject! {
        didSet {
            self.FeedPic.file = instagramPost["media"] as? PFFile
            self.caption.text = instagramPost["caption"] as? String
            self.FeedPic.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

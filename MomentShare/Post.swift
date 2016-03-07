//
//  Post.swift
//  MomentShare
//
//  Created by Shivam Bharuka on 3/6/16.
//  Copyright © 2016 Shivam Bharuka. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    class func postUserImage(image: UIImage?, withCompletion completion: PFBooleanResultBlock?) {
      
        let post = PFObject(className: "Post")
       
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        //post["caption"] = caption
        post["likesCount"] = 0
        post["commentsCount"] = 0
        
        post.saveInBackgroundWithBlock(completion)
    }

    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
 
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
}

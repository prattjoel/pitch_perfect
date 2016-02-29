//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Joel on 1/20/16.
//  Copyright © 2016 Joel. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL!, title: String!) {
        
        self.filePathUrl = filePathUrl
        self.title = title
    }
    
}
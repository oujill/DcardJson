//
//  Dcards.swift
//  DcardJson
//
//  Created by JillOU on 2020/8/18.
//  Copyright © 2020 Jillou. All rights reserved.
//

import Foundation
struct Dcards:Codable{
    var title:String
    var excerpt:String
    var commentCount:Int
    var likeCount:Int
    var forumName:String
    var school:String?
}
